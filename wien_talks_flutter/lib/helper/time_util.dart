// Clanker code, I caved
String timeAgo(DateTime? dt) {
  final d =
      (dt ?? DateTime.fromMillisecondsSinceEpoch(0, isUtc: true)).toLocal();
  final now = DateTime.now();
  final diff = now.isBefore(d) ? Duration.zero : now.difference(d);

  return switch (diff.inSeconds) {
    < 60 => 'just now',
    < 3600 => '${diff.inMinutes}m ago',
    < 86400 => '${diff.inHours}h ago',
    < 604800 => '${diff.inDays}d ago',
    _ => '${d.year.toString().padLeft(4, '0')}-'
        '${d.month.toString().padLeft(2, '0')}-'
        '${d.day.toString().padLeft(2, '0')}',
  };
}
