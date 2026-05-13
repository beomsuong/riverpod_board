import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/board_provider.dart';
import '../widgets/post_card.dart';
import '../widgets/user_avatar.dart';

class AuthorProfilePage extends ConsumerWidget {
  const AuthorProfilePage({super.key, required this.authorId});

  final String authorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersMapProvider);
    final authorPosts = ref.watch(postsByAuthorProvider(authorId));
    final author = users[authorId];

    if (author == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('프로필')),
        body: const Center(child: Text('사용자를 찾을 수 없습니다.')),
      );
    }

    final totalLikes = authorPosts.fold(0, (sum, p) => sum + p.likeCount);
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
                          value: '${authorPosts.length}',
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

          if (authorPosts.isEmpty)
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
              itemCount: authorPosts.length,
              separatorBuilder: (_, _) => const Divider(),
              itemBuilder: (context, index) {
                final post = authorPosts[index];
                return Consumer(
                  builder: (context, ref, _) {
                    final commentCount =
                        ref.watch(commentCountByPostProvider(post.id));
                    return PostCard(
                      post: post,
                      author: author,
                      commentCount: commentCount,
                      onTap: () => context.push('/post/${post.id}'),
                    );
                  },
                );
              },
            ),
        ],
      ),
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
