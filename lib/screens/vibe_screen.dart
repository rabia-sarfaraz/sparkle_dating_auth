import 'package:flutter/material.dart';
import 'swipe_right_screen.dart';

class VibeScreen extends StatefulWidget {
  const VibeScreen({super.key});

  @override
  State<VibeScreen> createState() => _VibeScreenState();
}

class _VibeScreenState extends State<VibeScreen> {
  final TextEditingController customVibeController = TextEditingController();

  final List<String> vibes = [
    'introvertish',
    'full-time-overthinker',
    'serial texter',
    'soft-spoken soul',
    'selectively social',
    'bookworm',
    'old soul in a young world',
    'vibe over everything',
    'filmy but not dramatic',
    'balcony philosopher',
    'emotional in HD',
    'hopelessly hopeful',
    'memes = love language',
    'reels researcher',
    'slow replier club',
    'always typing...',
    '3 AM texter',
    'Spotify storyteller',
    'series junkie',
    'metro mood',
    'puzzler person',
    'still Wordling',
    'bollywood baby',
    'pens random poetry',
  ];

  final Set<String> selectedVibes = {};

  void toggleVibe(String vibe) {
    setState(() {
      if (selectedVibes.contains(vibe)) {
        selectedVibes.remove(vibe);
      } else {
        if (selectedVibes.length < 3) {
          selectedVibes.add(vibe);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ✅ Linear Progress (5th screen of 5)
          SizedBox(
            height: 3,
            width: double.infinity,
            child: LinearProgressIndicator(
              value: 5 / 5,
              minHeight: 3,
              color: Colors.orange.shade300,
              backgroundColor: Colors.orange.shade100,
            ),
          ),

          // ✅ Expanded: Scrollable Content
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
                          'Your Overall Vibe',
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
                      'Pick up to 3 that sound like you',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: vibes.map((vibe) {
                        final bool isSelected = selectedVibes.contains(vibe);
                        return GestureDetector(
                          onTap: () => toggleVibe(vibe),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFFFD6A5)
                                  : Colors.white,
                              border: isSelected
                                  ? null
                                  : Border.all(color: Colors.lightBlueAccent),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              vibe,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 32),

                    const Text(
                      'Want to add your own?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: screenWidth * 0.85,
                      child: TextField(
                        controller: customVibeController,
                        decoration: InputDecoration(
                          hintText: 'Type here...',
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
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.lightBlueAccent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 80), // Bottom space for buttons
                  ],
                ),
              ),
            ),
          ),

          // ✅ Fixed Bottom Buttons
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                SizedBox(
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
                          builder: (context) => const SwipeRightScreen(),
                        ),
                      ); // No navigation now
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
                const SizedBox(height: 12),
                SizedBox(
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
                          builder: (context) => const SwipeRightScreen(),
                        ),
                      ); // No navigation now
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
