import 'package:flutter/material.dart';
import 'let_get_started_screen1.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

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
            // ✅ Main illustration - full width, slight up
            Align(
              alignment: const Alignment(0, -0.25),
              child: Image.asset(
                'assets/images/create_account.png',
                width: double.infinity,
                height: 450,
                fit: BoxFit.cover,
              ),
            ),

            // ✅ Rounded white rectangle image behind buttons
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Image.asset(
                  'assets/images/rectangle.png',
                  width: double.infinity,
                  height: 320, // Thoda bada for overlap
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // ✅ Buttons on top of white rectangle
            Positioned(
              bottom: 50,
              left: 40,
              right: 40,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFC7EFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LetGetStartedScreen1(),
                          ),
                        );
                      },
                      child: const Text(
                        'Create an Account',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.lightBlueAccent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LetGetStartedScreen1(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
