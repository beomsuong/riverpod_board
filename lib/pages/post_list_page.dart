import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/board_provider.dart';
import '../widgets/post_card.dart';

class PostListPage extends ConsumerWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 글 추가·삭제 시에만 리빌드 (좋아요·댓글로 인한 리빌드 없음)
    final postIds = ref.watch(postIdsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('게시판')),
      body: postIds.isEmpty
          ? const _EmptyView()
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: postIds.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) => _PostListItem(
                key: ValueKey(postIds[index]),
                postId: postIds[index],
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/write'),
        icon: const Icon(Icons.edit_outlined),
        label: const Text('글쓰기'),
      ),
    );
  }
}

/// 각 항목이 자신의 글(postByIdProvider)만 구독하여
/// 다른 글 변경 시 이 위젯은 리빌드되지 않는다.
class _PostListItem extends ConsumerWidget {
  const _PostListItem({required super.key, required this.postId});

  final String postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postByIdProvider(postId));
    final users = ref.watch(usersMapProvider);
    if (post == null) return const SizedBox.shrink();
    return PostCard(
      post: post,
      author: users[post.authorId],
      onTap: () => context.push('/post/$postId'),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.article_outlined, size: 64, color: cs.outlineVariant),
          const SizedBox(height: 16),
          Text(
            '아직 게시물이 없습니다.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: cs.outline,
                ),
          ),
        ],
      ),
    );
  }
}
