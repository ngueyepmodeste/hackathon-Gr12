import 'user.dart';

class Story {
  final String id;
  final User user;
  final String imageUrl;
  final bool viewed;

  Story({
    required this.id,
    required this.user,
    required this.imageUrl,
    this.viewed = false,
  });
} 