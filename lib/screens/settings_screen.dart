import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Top Back Arrow & Heading
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),

              const SizedBox(height: 32),

              // ✅ Options with forward arrow
              const SettingsTile(
                title: 'Privacy Policy',
                imagePath: 'assets/images/a.png',
              ),
              const SizedBox(height: 12),
              const SettingsTile(
                title: 'Terms of Services',
                imagePath: 'assets/images/b.png',
              ),
              const SizedBox(height: 12),
              const SettingsTile(
                title: 'Contact Us',
                imagePath: 'assets/images/c.png',
              ),
              const SizedBox(height: 12),
              const SettingsTile(
                title: 'Share',
                imagePath: 'assets/images/d.png',
              ),
              const SizedBox(height: 12),
              const SettingsTile(
                title: 'Delete Account',
                imagePath: 'assets/images/e.png',
              ),
              const SizedBox(height: 12),
              const SettingsTile(
                title: 'Log Out',
                imagePath: 'assets/images/f.png',
              ),

              const Spacer(),
            ],
          ),
        ),
      ),

      // ✅ Bottom Navigation Bar with Images
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
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
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final String imagePath;

  const SettingsTile({super.key, required this.title, required this.imagePath});

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
          Image.asset(imagePath, width: 24, height: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
