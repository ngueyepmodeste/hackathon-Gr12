import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../models/post.dart';
import 'components/comments_bottom_sheet.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      color: Colors.white,
      shadowColor: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(post.user.avatarUrl),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.user.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _timeAgo(post.timestamp),
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Icon(
                  LucideIcons.moreHorizontal,
                  color: Colors.grey[600],
                  size: 18,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(post.content),
            if (post.imageUrl.isNotEmpty) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(post.imageUrl, fit: BoxFit.cover),
              ),
            ],
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconText(LucideIcons.heart, post.likes.toString()),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => CommentsBottomSheet(
                        comments: [
                          Comment(
                            name: 'Thibaut Kouame',
                            avatarUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
                            timeAgo: '1 hour ago',
                            text: 'Great initiative! The data on renewable energy implementation is particularly interesting.',
                          ),
                          Comment(
                            name: 'Michael Chang',
                            avatarUrl: 'https://randomuser.me/api/portraits/men/6.jpg',
                            timeAgo: '45 minutes ago',
                            text: 'Would love to help implement some of these recommendations. When can we start?',
                          ),
                          Comment(
                            name: 'Professor Roberts',
                            avatarUrl: 'https://randomuser.me/api/portraits/men/7.jpg',
                            timeAgo: '30 minutes ago',
                            text: 'Excellent research work, Sarah! Looking forward to discussing this further in our next department meeting.',
                          ),
                          Comment(
                            name: 'Professor Roberts',
                            avatarUrl: 'https://randomuser.me/api/portraits/men/7.jpg',
                            timeAgo: '30 minutes ago',
                            text: 'Excellent research work, Sarah! Looking forward to discussing this further in our next department meeting.',
                          ),
                          Comment(
                            name: 'Professor Roberts',
                            avatarUrl: 'https://randomuser.me/api/portraits/men/7.jpg',
                            timeAgo: '30 minutes ago',
                            text: 'Excellent research work, Sarah! Looking forward to discussing this further in our next department meeting.',
                          ),
                          Comment(
                            name: 'Professor Roberts',
                            avatarUrl: 'https://randomuser.me/api/portraits/men/7.jpg',
                            timeAgo: '30 minutes ago',
                            text: 'Excellent research work, Sarah! Looking forward to discussing this further in our next department meeting.',
                          ),
                        ],
                      ),
                    );
                  },
                  child: _iconText(LucideIcons.messageCircle, post.comments.toString()),
                ),
                _iconText(LucideIcons.share, post.shares.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[700]),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.grey[700], fontSize: 13)),
      ],
    );
  }

  String _timeAgo(DateTime dateTime) {
    final diff = DateTime.now().difference(dateTime);
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) return '${diff.inHours} hours ago';
    return '${diff.inDays} days ago';
  }
}
