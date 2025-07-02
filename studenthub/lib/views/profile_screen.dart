import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/profile_view_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileVM = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil utilisateur'),
      ),
      body: FutureBuilder(
        future: profileVM.fetchProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }

          final user = profileVM.user;

          return user == null
              ? const Center(child: Text("Aucun utilisateur"))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nom : ${user['f_name']} ${user['l_name']}"),
                      Text("Email : ${user['email']}"),
                      Text("École : ${user['school']}"),
                      Text("Spécialité : ${user['major']}"),
                      Text("Année : ${user['major_year']}"),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Ajoute ici la déconnexion si nécessaire
                        },
                        child: const Text("Déconnexion"),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
