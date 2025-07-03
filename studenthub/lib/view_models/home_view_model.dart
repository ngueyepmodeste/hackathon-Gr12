import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/story.dart';
import '../models/post.dart';

class HomeViewModel extends ChangeNotifier {
  final List<User> _users = [
    User(
      id: '1',
      name: 'Thibaut Kouame',
      avatarUrl: 'https://images.unsplash.com/photo-1492462543947-040389c4a66c?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      isCurrentUser: true,
    ),
    User(
      id: '2',
      name: 'Klanan Dosselbétchin BAMBA',
      avatarUrl: 'https://media.licdn.com/dms/image/v2/D4E35AQFZ2Tl96zeAEw/profile-framedphoto-shrink_400_400/profile-framedphoto-shrink_400_400/0/1733684347532?e=1752044400&v=beta&t=u1z_gLwnHG_c-XqzUmlfUBgu-1T4TiHsdm8u0lypq2A',
    ),
    User(
      id: '3',
      name: 'Priya Singh',
      avatarUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
    ),
    User(
      id: '4',
      name: 'John Doe',
      avatarUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
    ),
  ];

  List<Story> get stories => [
    Story(
      id: 's1',
      user: _users[0],
      imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
      viewed: false,
    ),
    Story(
      id: 's2',
      user: _users[1],
      imageUrl: 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
      viewed: true,
    ),
    Story(
      id: 's3',
      user: _users[2],
      imageUrl: 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      viewed: false,
    ),
    Story(
      id: 's4',
      user: _users[3],
      imageUrl: 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
      viewed: true,
    ),
    Story(
      id: 's5',
      user: _users[3],
      imageUrl: 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
      viewed: true,
    ),
    Story(
        id: 's6',
      user: _users[3],
      imageUrl: 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
      viewed: true,
    ),
    Story(
      id: 's7',
      user: _users[2],
      imageUrl: 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
      viewed: true,
    ),
  ];

  List<Post> get posts => [
    Post(
      id: 'p1',
      user: _users[0],
      content: "Bienvenue à cet hackathon ! Pendant ces prochains jours, l’innovation, la collaboration et la créativité seront à l’honneur. Préparez-vous à repousser les limites et à transformer vos idées en solutions concrètes !",
      imageUrl: 'https://estiam-france.s3.eu-west-3.amazonaws.com/media/cf/43/7dae87a25558e616cd9b23d438ee.jpg',
      likes: 48,
      comments: 12,
      shares: 6,
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Post(
      id: 'p2',
      user: _users[1],
      content: 'Retour sur le week-end au ski à Chamrousse avec le BDE Sharkus !',
      imageUrl: 'https://estiam-france.s3.eu-west-3.amazonaws.com/media/31/9a/b4d39e9dce151ba094c0e59f95fe.jpg',
      likes: 30,
      comments: 5,
      shares: 2,
      timestamp: DateTime.now().subtract(Duration(minutes: 45)),
    ),
  ];
}
