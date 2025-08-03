import 'package:flutter/material.dart';
import 'payment_screen.dart';

class WordTrail3Screen extends StatelessWidget {
  const WordTrail3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color boxOutlineColor = Color(0xFFFFD6A5);
    const Color buttonColor = Color(0xFFC7EFFF);
    const Color bottomNavColor = Color(0xFFFFD6A5);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      'Your AI-Generated Trail Summary',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset(
                    'assets/images/right_icon.png',
                    height: 28,
                    width: 28,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Look what the two of you just created together ✨',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Main Box
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: boxOutlineColor, width: 3),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Ayesha and Rohan just painted a picture of a perfect rainy-day escape. She brought the Rain – soft, poetic, full of nostalgia. He answered with Samosa – golden, familiar, and comforting. Then came Chutney and Umbrella, adding spice and shelter to their vibe. Watery gave it mood. Canteen gave it place.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Match',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: OutlinedButton(
                          onPressed: () {
                            // TODO: Ignore action
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: buttonColor,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Ignore',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ✅ Better bottom nav bar — always stick to bottom
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: bottomNavColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/1.png', height: 28),
            Image.asset('assets/images/2.png', height: 28),
            Image.asset('assets/images/3.png', height: 28),
            Image.asset('assets/images/4.png', height: 28),
            Image.asset('assets/images/5.png', height: 28),
          ],
        ),
      ),
    );
  }
}
