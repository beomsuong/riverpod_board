import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/user.dart';
import '../providers/board_provider.dart';
import '../widgets/post_card.dart';
import '../widgets/user_avatar.dart';

class AuthorProfilePage extends ConsumerWidget {
  const AuthorProfilePage({super.key, required this.authorId});

  final String authorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersMapProvider);
    final postIds = ref.watch(postIdsByAuthorProvider(authorId));
    final author = users[authorId];

    if (author == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('프로필')),
        body: const Center(child: Text('사용자를 찾을 수 없습니다.')),
      );
    }

    // 통계 — 각 글의 PostController를 watch해 합산.
    // 카드 위젯도 동일 provider를 watch하므로 추가 cost 없음.
    var totalLikes = 0;
    for (final id in postIds) {
      final post = ref.watch(postControllerProvider(id));
      if (post != null) totalLikes = totalLikes + post.likeCount;
    }
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('프로필')),
      body: CustomScrollView(
        slivers: [
          // 프로필 헤더 — 아바타 색상 기반 그라데이션 배경
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    author.avatarColor.withValues(alpha: 0.12),
                    cs.surface,
                  ],
                ),
              ),
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
              child: Column(
                children: [
                  UserAvatar(user: author, radius: 40),
                  const SizedBox(height: 14),
                  Text(
                    author.name,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    author.bio,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _StatItem(
                          label: '작성한 글',
                          value: '${postIds.length}',
                        ),
                        VerticalDivider(
                          width: 48,
                          thickness: 0.5,
                          color: cs.outlineVariant,
                        ),
                        _StatItem(
                          label: '받은 좋아요',
                          value: '$totalLikes',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: Divider()),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                '작성한 글',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          if (postIds.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Text(
                  '작성한 글이 없습니다.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: cs.outline),
                ),
              ),
            )
          else
            SliverList.separated(
              itemCount: postIds.length,
              separatorBuilder: (_, _) => const Divider(),
              itemBuilder: (context, index) => _AuthorPostTile(
                key: ValueKey(postIds[index]),
                postId: postIds[index],
                author: author,
              ),
            ),
        ],
      ),
    );
  }
}

/// 작성자 프로필의 글 1건. 자기 PostController만 watch한다.
class _AuthorPostTile extends ConsumerWidget {
  const _AuthorPostTile({
    super.key,
    required this.postId,
    required this.author,
  });

  final String postId;
  final User author;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postControllerProvider(postId));
    final commentCount = ref.watch(
      commentIdsByPostProvider(postId).select((ids) => ids.length),
    );
    if (post == null) return const SizedBox.shrink();
    return PostCard(
      post: post,
      author: author,
      commentCount: commentCount,
      onTap: () => context.push('/post/$postId'),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.outline,
          ),
        ),
      ],
    );
  }
}
