import 'package:flutter/material.dart';
import 'inbox_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryButtonColor = Color(0xFFC7EFFF); // same as match button
    const Color outlineButtonColor = Color(0xFFC7EFFF); // same as ignore button
    const Color coinBoxColor = Color(0xFFFFD6A5);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Top Row: Back Arrow + Heading
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Unlock Chat',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ✅ Description Text
              const Text(
                'Your trail is complete — ready to talk?\nUse 1 coin to start chatting with your match.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),

              const SizedBox(height: 32),

              // ✅ Center Image
              Center(
                child: Image.asset(
                  'assets/images/chat_unlock.png', // Replace with your image path
                  height: 200,
                ),
              ),

              const SizedBox(height: 32),

              // ✅ Use Coin Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InboxScreen(),
                      ),
                    ); // TODO: Add action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Use Coin',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ✅ Maybe Later Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: Add action
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: outlineButtonColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Maybe Later',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // ✅ Coin Info Box
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: coinBoxColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/coin.png', // Replace with your coin image path
                      height: 30,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      '1 coin = 20 INR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
