import 'package:flutter/material.dart';

import '../core/extensions/datetime_ext.dart';
import '../models/comment.dart';
import '../models/user.dart';
import 'user_avatar.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.comment, this.author});

  static const rootKey = Key('commentItemRoot');
  static const avatarKey = Key('commentItemAvatar');
  static const authorNameKey = Key('commentItemAuthorName');
  static const createdAtKey = Key('commentItemCreatedAt');
  static const contentKey = Key('commentItemContent');

  final Comment comment;
  final User? author;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      key: rootKey,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (author != null)
            UserAvatar(key: avatarKey, user: author!, radius: 16),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      author?.name ?? '알 수 없음',
                      key: authorNameKey,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      comment.createdAt.timeAgo,
                      key: createdAtKey,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: cs.outline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  comment.content,
                  key: contentKey,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
