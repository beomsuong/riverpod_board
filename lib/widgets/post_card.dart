import 'package:flutter/material.dart';

import '../core/extensions/datetime_ext.dart';
import '../models/post.dart';
import '../models/user.dart';
import 'user_avatar.dart';

/// 순수 표현 위젯 — provider를 직접 watch하지 않고 필요한 값을 파라미터로 받습니다.
class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
    required this.author,
    required this.commentCount,
    required this.onTap,
  });

  static const tapKey = Key('postCardTap');
  static const authorRowKey = Key('postCardAuthorRow');
  static const authorNameKey = Key('postCardAuthorName');
  static const createdAtKey = Key('postCardCreatedAt');
  static const titleKey = Key('postCardTitle');
  static const contentKey = Key('postCardContent');
  static const likeCountKey = Key('postCardLikeCount');
  static const commentCountKey = Key('postCardCommentCount');

  final Post post;
  final User? author;
  final int commentCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return InkWell(
      key: tapKey,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (author != null)
              Row(
                key: authorRowKey,
                children: [
                  UserAvatar(user: author!, radius: 12),
                  const SizedBox(width: 8),
                  Text(
                    author!.name,
                    key: authorNameKey,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    post.createdAt.timeAgo,
                    key: createdAtKey,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: cs.outline,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 8),
            Text(
              post.title,
              key: titleKey,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              post.content,
              key: contentKey,
              style: theme.textTheme.bodySmall?.copyWith(
                color: cs.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _MetaChip(
                  key: likeCountKey,
                  icon: Icons.favorite_border_rounded,
                  label: '${post.likeCount}',
                ),
                const SizedBox(width: 12),
                _MetaChip(
                  key: commentCountKey,
                  icon: Icons.mode_comment_outlined,
                  label: '$commentCount',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.outline;
    return Row(
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 3),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
        ),
      ],
    );
  }
}
