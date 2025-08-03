import 'package:flutter/material.dart';
import 'profile_data_screen.dart';

class ManageOptionsScreen extends StatelessWidget {
  const ManageOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // ✅ Full-screen background image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/background2.png',
              fit: BoxFit.cover,
            ),
          ),

          // ✅ Bottom white box with rounded top corners + scroll
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.25,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ✅ Removed the Line.png icon
                      const Text(
                        'Replace Photo',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 24,
                        endIndent: 24,
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Delete Photo',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 24,
                        endIndent: 24,
                      ),

                      const SizedBox(height: 8),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileDataScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Set as Primary Photo',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
