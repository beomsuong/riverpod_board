import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/extensions/datetime_ext.dart';
import '../providers/board_provider.dart';
import '../widgets/comment_item.dart';
import '../widgets/user_avatar.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  const PostDetailPage({super.key, required this.postId});

  final String postId;

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  final _commentController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submitComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;
    ref.read(boardProvider.notifier).addComment(widget.postId, text);
    _commentController.clear();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final post = ref.watch(postByIdProvider(widget.postId));
    final users = ref.watch(usersMapProvider);
    final comments = ref.watch(commentsByPostProvider(widget.postId));

    if (post == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('글 상세')),
        body: const Center(child: Text('게시물을 찾을 수 없습니다.')),
      );
    }

    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final author = users[post.authorId];
    final isLiked = post.likedUserIds.contains(currentUserId);

    return Scaffold(
      appBar: AppBar(title: const Text('글 상세')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // 작성자 영역
                if (author != null)
                  InkWell(
                    onTap: () => context.push('/author/${author.id}'),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          UserAvatar(user: author, radius: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  author.name,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  post.createdAt.fullDateTime,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: cs.outline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: cs.outlineVariant,
                          ),
                        ],
                      ),
                    ),
                  ),

                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 16),

                // 제목
                Text(
                  post.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),

                // 본문
                Text(
                  post.content,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.7),
                ),
                const SizedBox(height: 28),
                const Divider(),

                // 좋아요 / 댓글 액션 바
                Row(
                  children: [
                    _ActionButton(
                      icon: isLiked
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      label: '${post.likeCount}',
                      color: isLiked ? Colors.red : cs.outline,
                      onTap: () => ref
                          .read(boardProvider.notifier)
                          .toggleLike(widget.postId),
                    ),
                    const SizedBox(width: 8),
                    _ActionButton(
                      icon: Icons.mode_comment_outlined,
                      label: '${comments.length}',
                      color: cs.outline,
                      onTap: () => _focusNode.requestFocus(),
                    ),
                  ],
                ),

                const Divider(),
                const SizedBox(height: 4),

                // 댓글 목록
                Text(
                  '댓글 ${comments.length}개',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (comments.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: Text(
                        '첫 번째 댓글을 남겨보세요.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: cs.outline,
                        ),
                      ),
                    ),
                  )
                else
                  ...comments.map(
                    (comment) => CommentItem(
                      comment: comment,
                      author: users[comment.authorId],
                    ),
                  ),
              ],
            ),
          ),

          // 댓글 입력창
          const Divider(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                        hintText: '댓글을 입력하세요...',
                      ),
                      maxLines: null,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _submitComment(),
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton.filled(
                    onPressed: _submitComment,
                    icon: const Icon(Icons.send_rounded),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
