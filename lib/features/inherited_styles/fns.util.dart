Map<String, dynamic> $(Map<String, dynamic> styles) {
  return Map<String, dynamic>.from(styles)
    ..removeWhere((k, _) => !k.startsWith('\$'))
    ..map((key, value) => MapEntry(key.substring(1), value));
}
