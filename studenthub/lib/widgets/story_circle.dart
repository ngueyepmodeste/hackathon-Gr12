import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studenthub/core/constants/colors.dart';
import '../models/story.dart';

class StoryCircle extends StatelessWidget {
  final Story story;
  const StoryCircle({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: story.viewed ? Colors.grey : AppColors.primary,
              width: 3,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(story.user.avatarUrl),
            radius: 28,
          ),
        ),
        const SizedBox(height: 1),
        SizedBox(
          width: 70,
          child: Text(
            story.user.isCurrentUser ? 'Your Story' : story.user.name.split(' ')[0],
            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
} 