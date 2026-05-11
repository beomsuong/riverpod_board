import 'package:flutter/material.dart';

import '../core/extensions/datetime_ext.dart';
import '../models/comment.dart';
import '../models/user.dart';
import 'user_avatar.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.comment, this.author});

  final Comment comment;
  final User? author;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (author != null) UserAvatar(user: author!, radius: 16),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      author?.name ?? '알 수 없음',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      comment.createdAt.timeAgo,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: cs.outline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(comment.content, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
