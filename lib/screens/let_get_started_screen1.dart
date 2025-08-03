import 'package:flutter/material.dart';
import 'let_get_started_screen2.dart';

class LetGetStartedScreen1 extends StatelessWidget {
  const LetGetStartedScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ Pure white background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ✅ Back Arrow
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              const SizedBox(height: 8), // gap after back arrow
              // ✅ Logo container same as splash but shifted down a bit
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 239, 192, 120),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/s.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Image.asset(
                        'assets/images/star.png',
                        width: 16,
                        height: 16,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ✅ Main Heading bigger & bolder
              const Text(
                "Let's Get Started",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
              ),

              const SizedBox(height: 24),

              // ✅ Subheading bold
              const Text(
                'CHOOSE AN OPTION TO SIGN UP',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w900, // More bold
                ),
              ),

              const SizedBox(height: 32),

              // Phone Number Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFFC7EFFF),
                    side: BorderSide(color: Colors.lightBlueAccent.shade100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.phone, color: Colors.black),
                  label: const Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LetGetStartedScreen2(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Email Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFFC7EFFF),
                    side: BorderSide(color: Colors.lightBlueAccent.shade100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.email_outlined, color: Colors.black),
                  label: const Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LetGetStartedScreen2(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ALREADY HAVE AN ACCOUNT? ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900, // More bold
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LetGetStartedScreen2(),
                        ),
                      );
                    },
                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              const Text(
                'Or continue with Google or Apple',
                style: TextStyle(fontSize: 12),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white, // ✅ White background only
                    child: Image.asset(
                      'assets/images/google.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(width: 24),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white, // ✅ White background only
                    child: Image.asset(
                      'assets/images/apple.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
