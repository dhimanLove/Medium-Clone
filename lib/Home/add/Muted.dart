import 'package:flutter/material.dart';
import 'package:mediumm/theme/Apptheme.dart';

class User {
  final String username;
  final String profilePictureUrl;

  User({required this.username, required this.profilePictureUrl});
}

class Muted extends StatefulWidget {
  const Muted({super.key});

  @override
  State<Muted> createState() => _MutedState();
}

class _MutedState extends State<Muted> {
  late List<User> _mutedUsers;

  @override
  void initState() {
    super.initState();
    _mutedUsers = [
      User(username: 'EchoShadow', profilePictureUrl: 'https://picsum.photos/200?random=1'),
      User(username: 'SilentStorm', profilePictureUrl: 'https://picsum.photos/200?random=2'),
      User(username: 'MutedSoul', profilePictureUrl: 'https://picsum.photos/200?random=3'),
      User(username: 'WhisperKnight', profilePictureUrl: 'https://picsum.photos/200?random=4'),
      User(username: 'PhantomEcho', profilePictureUrl: 'https://picsum.photos/200?random=5'),
      User(username: 'GhostByte', profilePictureUrl: 'https://picsum.photos/200?random=6'),
      User(username: 'HushedHawk', profilePictureUrl: 'https://picsum.photos/200?random=7'),
      User(username: 'MuffledWolf', profilePictureUrl: 'https://picsum.photos/200?random=8'),
      User(username: 'SilentVortex', profilePictureUrl: 'https://picsum.photos/200?random=9'),
      User(username: 'NoSoundNinja', profilePictureUrl: 'https://picsum.photos/200?random=10'),
      User(username: 'ZenVoid', profilePictureUrl: 'https://picsum.photos/200?random=11'),
      User(username: 'MysteriousMute', profilePictureUrl: 'https://picsum.photos/200?random=12'),
      User(username: 'VanishingEcho', profilePictureUrl: 'https://picsum.photos/200?random=13'),
      User(username: 'ShadowedSilence', profilePictureUrl: 'https://picsum.photos/200?random=14'),
      User(username: 'MutedMystic', profilePictureUrl: 'https://picsum.photos/200?random=15'),
      User(username: 'FrostWhisper', profilePictureUrl: 'https://picsum.photos/200?random=16'),
      User(username: 'StealthSiren', profilePictureUrl: 'https://picsum.photos/200?random=17'),
      User(username: 'CrypticEcho', profilePictureUrl: 'https://picsum.photos/200?random=18'),
      User(username: 'HushModeOn', profilePictureUrl: 'https://picsum.photos/200?random=19'),
      User(username: 'QuietRebel', profilePictureUrl: 'https://picsum.photos/200?random=20'),
    ];
  }


  void _unMuteUser(User user) {
    setState(() {
      _mutedUsers.remove(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[900], // Dark theme background
      body: SafeArea(
        child: _mutedUsers.isEmpty
            ? const Center(
          child: Text(
            'No muted users',
            style: TextStyle(
              //color: Colors.white70,
              fontSize: 18,
            ),
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _mutedUsers.length,
          itemBuilder: (context, index) {
            final user = _mutedUsers[index];
            return Card(
              color: AppThemes.darkTheme.cardColor,
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(user.profilePictureUrl),
                  onBackgroundImageError: (exception, stackTrace) {
                    print('Error loading image: $exception');
                  }, // Add error handling
                ),
                title: Text(
                  user.username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  'Muted on: ${DateTime.now().toString().substring(0, 10)}',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () => _unMuteUser(user),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    'Unmute', // Fixed space in text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}