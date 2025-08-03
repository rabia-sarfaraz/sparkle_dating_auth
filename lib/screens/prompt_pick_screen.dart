import 'package:flutter/material.dart';
import 'music_screen.dart';

class PromptPickScreen extends StatefulWidget {
  const PromptPickScreen({super.key});

  @override
  State<PromptPickScreen> createState() => _PromptPickScreenState();
}

class _PromptPickScreenState extends State<PromptPickScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();
  final TextEditingController controller7 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ✅ Linear Progress bilkul top pe, SafeArea ke bahar
          SizedBox(
            height: 3,
            width: double.infinity,
            child: LinearProgressIndicator(
              value: 1 / 5,
              minHeight: 3,
              color: Colors.orange.shade300,
              backgroundColor: Colors.orange.shade100,
            ),
          ),

          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Back arrow + heading
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Your Prompt Picks',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Answer Up to 3 Prompts',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),

                    const SizedBox(height: 20),

                    _buildPrompt('A word that describes me', controller1),
                    _buildPrompt('I’d never say no to...', controller2),
                    _buildPrompt('My unpopular opinion', controller3),
                    _buildPrompt('One place I keep going back to', controller4),
                    _buildPrompt('I’m the kind of person who...', controller5),
                    _buildPrompt(
                      'One thing I probably shouldn’t admit on a dating app...',
                      controller6,
                    ),
                    _buildPrompt('If we date, prepare for...', controller7),

                    const SizedBox(height: 20),

                    // ✅ Continue Button
                    Center(
                      child: SizedBox(
                        width: screenWidth * 0.6, // thodi kam width
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
                                builder: (context) => const MusicScreen(),
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
                        width: screenWidth * 0.6, // thodi kam width
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.lightBlueAccent,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MusicScreen(),
                              ),
                            ); // TODO: Add skip action
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrompt(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type here...',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
