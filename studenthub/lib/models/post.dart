import 'user.dart';

class Post {
  final String id;
  final User user;
  final String content;
  final String imageUrl;
  final int likes;
  final int comments;
  final int shares;
  final DateTime timestamp;

  Post({
    required this.id,
    required this.user,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.timestamp,
  });
} 