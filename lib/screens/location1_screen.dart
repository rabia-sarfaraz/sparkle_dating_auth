import 'package:flutter/material.dart';
import 'location2_screen.dart';

class Location1Screen extends StatelessWidget {
  const Location1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar at top
            LinearProgressIndicator(
              value: 3 / 6,
              minHeight: 3,
              color: Colors.orange.shade300,
              backgroundColor: Colors.orange.shade100,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Arrow & Heading
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
                          'Location',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),

                    // Center Image
                    Center(
                      child: Image.asset(
                        'assets/images/location.png',
                        height: 180,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Enable Location
                    const Center(
                      child: Text(
                        'Enable Location',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Info Text
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            'We use your location to show you\nnearby profiles.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "You'll need to enable it to use Sparkle.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
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
                          builder: (context) => const Location2Screen(),
                        ),
                      );
                      // ✅ Removed Navigator.pop()
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Enable Location',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
