import 'package:flutter/material.dart';
import 'vibe_screen.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  final TextEditingController mediaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Linear Progress bilkul top pe, SafeArea ke bahar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                value: 4 / 5,
                minHeight: 3,
                color: Colors.orange.shade300,
                backgroundColor: Colors.orange.shade100,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Back arrow + heading
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Your TV, Book, or Game Picks',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'What are you into right now?',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: screenWidth * 0.85,
                    child: TextField(
                      controller: mediaController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText:
                            "TV shows, movies, books, or games — whatever you're enjoying",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.lightBlueAccent,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.lightBlueAccent,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  // ✅ Continue Button
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.65,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC7EFFF),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VibeScreen(),
                            ),
                          ); // TODO: Add navigation
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

                  const SizedBox(height: 12),

                  // ✅ Skip Button
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.65,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.lightBlueAccent),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VibeScreen(),
                            ),
                          ); // TODO: Add skip navigation
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
