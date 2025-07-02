import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:studenthub/core/constants/app_texts.dart';
import 'package:studenthub/core/constants/colors.dart';
import '../view_models/home_view_model.dart';
import '../widgets/story_circle.dart';
import '../widgets/post_card.dart';
import 'package:studenthub/widgets/components/search_input_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            AppTexts.appName,
            style: GoogleFonts.pacifico(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.menu, color: Colors.black),
          //     onPressed: () {},
          //   ),
          // ],
        ),
        body: Consumer<HomeViewModel>(
          builder:
              (context, vm, _) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: SearchInputMenu(),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: vm.stories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder:
                            (context, i) => StoryCircle(story: vm.stories[i]),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: vm.posts.length,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      itemBuilder: (context, i) => PostCard(post: vm.posts[i]),
                    ),
                  ],
                ),
              ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            iconSize: 20,
            items: const [
              BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Accueil'),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.school),
                label: 'Académique',
              ),
              BottomNavigationBarItem(icon: Icon(LucideIcons.users),
                label: 'Communautés',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.messageCircle),
                label: 'Messages',
              ),
              BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Mon compte'),
            ],
          ),
        ),
      ),
    );
  }
}
