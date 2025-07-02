class User {
  final String id;
  final String name;
  final String avatarUrl;
  final bool isCurrentUser;

  User({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.isCurrentUser = false,
  });
}
