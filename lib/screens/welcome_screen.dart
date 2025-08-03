import 'package:flutter/material.dart';
import 'about_you1_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ Pure white background
      body: Stack(
        children: [
          // ✅ Background Image (on white)
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // <-- Your image path
              fit: BoxFit.cover,
            ),
          ),

          // Main Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 72, // Bigger than 'to Sparkle!'
                      fontWeight: FontWeight.w900, // Extra bold
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FittedBox(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 60, // Same as before
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(text: 'to '),
                          TextSpan(
                            text: 'Sparkle!',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom: Text above button
          Positioned(
            bottom: 100, // Above button
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                'Ready to find your spark?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),

          // Bottom Button
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutYou1Screen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFFC7EFFF,
                  ), // ✅ Your custom color
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Let's Begin",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
        ],
      ),
    );
  }
}
