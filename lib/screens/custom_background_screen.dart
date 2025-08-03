import 'package:flutter/material.dart';
import 'prompt_pick_screen.dart';

class CustomBackgroundScreen extends StatelessWidget {
  const CustomBackgroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // ✅ Full background image
          Positioned.fill(
            child: Image.asset('assets/images/hands.png', fit: BoxFit.cover),
          ),

          // ✅ Center Left Image (size bigger & more left)
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height * 0.2,
            child: Container(
              width: 400,
              height: 400,
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/htext.png',
                fit: BoxFit.fill, // 👈 force fit
              ),
            ),
          ),

          // ✅ Bottom Continue Button
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: screenWidth * 0.65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD6A5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PromptPickScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.black,
                      ),
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
