import 'package:flutter/material.dart';
import 'profile_view_screen.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const lightBrown = Color(0xFFFFD6A5);
    const outlineColor = Color(0xFF70D6FF); // your blue
    const viewProfileColor = Color(0xFFC7EFFF);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double screenWidth = constraints.maxWidth;
            final double cardWidth = screenWidth * 0.6;

            return Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Discover Matches',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                ),

                const SizedBox(height: 40),

                Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 400,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          buildProfileCard(
                            width: cardWidth,
                            image: 'assets/images/ahmed.png',
                            name: 'Ahmed',
                            profession: 'Doctor',
                          ),
                          const SizedBox(width: 16),
                          buildProfileCard(
                            width: cardWidth,
                            image: 'assets/images/rohan.png',
                            name: 'Rohan',
                            profession: 'Architect',
                          ),
                          const SizedBox(width: 16),
                          buildProfileCard(
                            width: cardWidth,
                            image: 'assets/images/ali.png',
                            name: 'Ali',
                            profession: 'Civil Engineer',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // ✅ View Profile Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileViewScreen(),
                      ),
                    ); // Add any action here if needed
                  },
                  icon: const Icon(Icons.remove_red_eye, color: Colors.black),
                  label: const Text(
                    'View Profile',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: viewProfileColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ✅ Icons row
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (screenWidth - cardWidth) / 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 78,
                        width: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: outlineColor, width: 3),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          'assets/images/dislike.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Image.asset(
                        'assets/images/star1.png',
                        height: 78,
                        width: 78,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ✅ Bottom Nav Icons (no navigator)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: lightBrown,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/1.png', height: 28),
                      Image.asset('assets/images/2.png', height: 28),
                      Image.asset('assets/images/3.png', height: 28),
                      Image.asset('assets/images/4.png', height: 28),
                      Image.asset('assets/images/5.png', height: 28),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildProfileCard({
    required double width,
    required String image,
    required String name,
    required String profession,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: width * 4 / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        Container(
          width: width,
          decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: double.infinity,
                child: Text(
                  profession,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
