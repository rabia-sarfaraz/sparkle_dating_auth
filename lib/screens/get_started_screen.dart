import 'package:flutter/material.dart';
import 'create_account_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB2EBF2), Color(0xFFFFE0B2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            // Center Logo Container
            Center(
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 192, 117),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // ✅ S Image
                    Image.asset(
                      'assets/images/s.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    // ✅ Star Image same as splash screen
                    Positioned(
                      top: 20, // ✅ SAME
                      right: 20, // ✅ SAME
                      child: Image.asset(
                        'assets/images/star.png',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Get Started button at bottom
            Positioned(
              bottom: 80,
              left: 64,
              right: 64,
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen(),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom image
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Image.asset('assets/images/Line.png', height: 50),
            ),
          ],
        ),
      ),
    );
  }
}
