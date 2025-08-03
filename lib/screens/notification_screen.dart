import 'package:flutter/material.dart';
import 'word_trail_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFFFFD6A5);
    const buttonColor = Color(0xFFC7EFFF);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background1.png',
            ), // Replace with your BG path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 300,
            height: 380,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor, width: 3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Ayesha, you just sparked something with Rohan!',
                  textAlign: TextAlign.center, // ✅ Center align for multi-line
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16, // Slightly smaller
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset('assets/images/spark.png', height: 90),
                const SizedBox(height: 20),
                const Text(
                  'To see where this spark leads, start a word trail.',
                  textAlign: TextAlign.center, // ✅ Center align for multi-line
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14, // Slightly smaller
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordTrailScreen(),
                        ),
                      ); // Your button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Start Word Trail',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
