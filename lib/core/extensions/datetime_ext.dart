extension DateTimeExt on DateTime {
  /// 2025.05.11 14:30
  String get fullDateTime {
    final mo = month.toString().padLeft(2, '0');
    final d = day.toString().padLeft(2, '0');
    final h = hour.toString().padLeft(2, '0');
    final mi = minute.toString().padLeft(2, '0');
    return '$year.$mo.$d $h:$mi';
  }

  /// n분 전 / n시간 전 / n일 전 / 5/11
  String get timeAgo {
    final diff = DateTime.now().difference(this);
    if (diff.inMinutes < 1) return '방금 전';
    if (diff.inMinutes < 60) return '${diff.inMinutes}분 전';
    if (diff.inHours < 24) return '${diff.inHours}시간 전';
    if (diff.inDays < 7) return '${diff.inDays}일 전';
    return '$month/$day';
  }
}
