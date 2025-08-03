import 'package:flutter/material.dart';
import 'manage_photos_screen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color buttonColor = Color(0xFFC7EFFF);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'My Profile',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Circular Image
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/ayesha_profile.png'),
            ),

            const SizedBox(height: 20),

            // ✅ Name
            const Text(
              'Ayesha',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // ✅ Manage My Photos Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManagePhotosScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'Manage My Photos',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ✅ My Profile Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.contacts, color: buttonColor, size: 28),
                  const SizedBox(width: 12),
                  const Text(
                    'My Profile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),

            // ✅ Settings Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.settings, color: buttonColor, size: 28),
                  const SizedBox(width: 12),
                  const Text(
                    'Settings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),

            const Spacer(), // ✅ Pushes bottom nav to screen bottom
            // ✅ Bottom Nav — Fixed to Screen Bottom
            Container(
              margin: const EdgeInsets.only(bottom: 20),
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
          ],
        ),
      ),
    );
  }
}
