import 'package:flutter/material.dart';
import 'package:studenthub/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CommentsBottomSheet extends StatelessWidget {
  final List<Comment> comments;
  const CommentsBottomSheet({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Text('Comments (${comments.length})', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black)),
                const Spacer(),
                IconButton(
                  icon: const Icon(LucideIcons.x, color: Colors.black, size: 18),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: comments.length,
              itemBuilder: (context, i) {
                final c = comments[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(c.avatarUrl),
                        radius: 18,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(c.name, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary)),
                                const Spacer(),
                                Text(c.timeAgo, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey[600])),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(c.text, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Ajouter un commentaire...',
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text('Post', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Comment {
  final String name;
  final String avatarUrl;
  final String timeAgo;
  final String text;
  Comment({required this.name, required this.avatarUrl, required this.timeAgo, required this.text});
} 