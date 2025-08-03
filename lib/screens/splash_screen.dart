import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/get_started');
    });
  }

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
            Center(
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 239, 192, 120),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // ✅ Replace text with your S image
                    Image.asset(
                      'assets/images/s.png', // 🟠 Replace with your S image path
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    // ✅ Replace icon with your star image
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Image.asset(
                        'assets/images/star.png', // 🟠 Replace with your star image path
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
