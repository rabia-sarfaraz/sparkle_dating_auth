import 'package:flutter/material.dart';
import 'add_image_screen.dart';

class MatchPreferenceScreen extends StatefulWidget {
  const MatchPreferenceScreen({super.key});

  @override
  State<MatchPreferenceScreen> createState() => _MatchPreferenceScreenState();
}

class _MatchPreferenceScreenState extends State<MatchPreferenceScreen> {
  String? selectedIdentity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Progress bar updated to 4/6
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                value: 4 / 6,
                minHeight: 3,
                color: Colors.orange.shade300,
                backgroundColor: Colors.orange.shade100,
              ),
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
                    // ✅ Back arrow & heading
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
                          'Match Preference',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // ✅ Updated label
                    const Text(
                      '• Select Your Match Preference*',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ✅ Identity Options - vertical (without "Prefer not to say")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildIdentityOption('Male'),
                        const SizedBox(height: 12),
                        buildIdentityOption('Female'),
                        const SizedBox(height: 12),
                        buildIdentityOption('Non-binary'),
                        const SizedBox(height: 12),
                        buildIdentityOption('Prefer to self-describe'),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ✅ Agreement green circle + text — moved above Spacer
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(color: Colors.green, width: 2),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'I agree to the Terms of Use and Privacy Policy',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // ✅ Continue Button
                    Center(
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
                                builder: (context) => const AddImageScreen(),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIdentityOption(String label) {
    final isSelected = selectedIdentity == label;
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIdentity = label;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange.shade100 : Colors.white,
            border: isSelected
                ? null
                : Border.all(color: Colors.lightBlueAccent, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
