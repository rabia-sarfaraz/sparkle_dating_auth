import 'package:flutter/material.dart';
import 'about_you2_screen.dart';

class AboutYou1Screen extends StatefulWidget {
  const AboutYou1Screen({super.key});

  @override
  State<AboutYou1Screen> createState() => _AboutYou1ScreenState();
}

class _AboutYou1ScreenState extends State<AboutYou1Screen> {
  String? selectedIdentity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress bar at very top
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                value: 1 / 6,
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
                    // Back arrow & heading
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
                          'About You',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Name / Nickname Label with dot
                    const Text(
                      '• Name or Nickname*',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // TextField
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText:
                                'Your first name, nickname, or just an initial',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.lightBlueAccent,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.lightBlueAccent,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // How do you identify Label with dot
                    const Text(
                      '• How do you identify?*',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Identity Options - vertical
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildIdentityOption('Male'),
                        const SizedBox(height: 12),
                        buildIdentityOption('Female'),
                        const SizedBox(height: 12),
                        buildIdentityOption('Non-binary'),
                        const SizedBox(height: 12),
                        buildIdentityOption('Prefer not to say'),
                        const SizedBox(height: 12),
                        buildIdentityOption('Prefer to self-describe'),
                      ],
                    ),

                    const Spacer(),

                    // Continue Button
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFC7EFFF),

                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutYou2Screen(),
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
            alignment: Alignment.centerLeft, // <-- text left aligned
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
