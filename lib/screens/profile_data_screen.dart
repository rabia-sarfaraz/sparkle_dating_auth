import 'package:flutter/material.dart';
import 'settings_screen.dart';

class ProfileDataScreen extends StatelessWidget {
  const ProfileDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Back arrow & heading
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),

              const SizedBox(height: 48),

              // ✅ Sections
              const ProfileTile(title: 'Bio'),
              const SizedBox(height: 12),
              const ProfileTile(title: 'Date of Birth'),
              const SizedBox(height: 12),
              const ProfileTile(title: 'Location'),
              const SizedBox(height: 12),
              const ProfileTile(title: 'Match Preference'),
              const SizedBox(height: 12),
              const ProfileTile(title: 'My Photos'),
              const SizedBox(height: 12),
              const ProfileTile(title: 'More About Me Questions'),

              const Spacer(),
            ],
          ),
        ),
      ),

      // ✅ Bottom Nav Button with 5 Images & Navigator
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsScreen()),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary, // From theme
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Image(image: AssetImage('assets/images/1.png'), height: 28),
              Image(image: AssetImage('assets/images/2.png'), height: 28),
              Image(image: AssetImage('assets/images/3.png'), height: 28),
              Image(image: AssetImage('assets/images/4.png'), height: 28),
              Image(image: AssetImage('assets/images/5.png'), height: 28),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  const ProfileTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
        ],
      ),
    );
  }
}
