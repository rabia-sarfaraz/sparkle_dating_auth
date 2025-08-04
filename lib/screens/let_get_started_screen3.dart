import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'let_get_started_screen4.dart';

class LetGetStartedScreen3 extends StatefulWidget {
  const LetGetStartedScreen3({super.key});

  @override
  State<LetGetStartedScreen3> createState() => _LetGetStartedScreen3State();
}

class _LetGetStartedScreen3State extends State<LetGetStartedScreen3> {
  final TextEditingController _numberController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String selectedCountry = 'IN';
  String countryCode = '+91';

  final List<Map<String, String>> countryCodes = [
    {'name': 'IN', 'code': '+91'},
    {'name': 'PK', 'code': '+92'},
    {'name': 'US', 'code': '+1'},
  ];

  void _onKeyboardTap(String value) {
    setState(() {
      _numberController.text += value;
    });
  }

  void _onBackspace() {
    setState(() {
      if (_numberController.text.isNotEmpty) {
        _numberController.text = _numberController.text.substring(
          0,
          _numberController.text.length - 1,
        );
      }
    });
  }

  void _verify() async {
    if (_numberController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your number')));
    } else {
      String phoneNumber = '$countryCode${_numberController.text}';
      print('Sending OTP to: $phoneNumber');

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification
          await _auth.signInWithCredential(credential);
          print("Auto Verified!");
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification Failed: ${e.message}");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Failed: ${e.message}")));
        },
        codeSent: (String verificationId, int? resendToken) {
          print('Verification ID: $verificationId');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  LetGetStartedScreen4(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Timeout: $verificationId');
        },
      );
    }
  }

  Widget buildKey(String number, String letters, {VoidCallback? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              if (letters.isNotEmpty)
                Text(
                  letters,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // White section
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Spacer(),
                      const Text(
                        "Let's Get Started",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Center(
                    child: Text(
                      'Enter Your Number',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedCountry,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              size: 16,
                              color: Colors.black,
                            ),
                            items: countryCodes.map((country) {
                              return DropdownMenuItem<String>(
                                value: country['name'],
                                child: Text(
                                  '${country['name']} ${country['code']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedCountry = newValue!;
                                countryCode = countryCodes.firstWhere(
                                  (c) => c['name'] == newValue,
                                )['code']!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _numberController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter number',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      "We'll text you a verification code",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Flexible(
                        child: Text(
                          "By signing up, you agree to the Terms of Service and Privacy Policy",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: _verify,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC7EFFF),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Colors.blueAccent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Grey keypad area
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'From Messages',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '123 456',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            buildKey('1', '', onTap: () => _onKeyboardTap('1')),
                            buildKey(
                              '2',
                              'ABC',
                              onTap: () => _onKeyboardTap('2'),
                            ),
                            buildKey(
                              '3',
                              'DEF',
                              onTap: () => _onKeyboardTap('3'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            buildKey(
                              '4',
                              'GHI',
                              onTap: () => _onKeyboardTap('4'),
                            ),
                            buildKey(
                              '5',
                              'JKL',
                              onTap: () => _onKeyboardTap('5'),
                            ),
                            buildKey(
                              '6',
                              'MNO',
                              onTap: () => _onKeyboardTap('6'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            buildKey(
                              '7',
                              'PQRS',
                              onTap: () => _onKeyboardTap('7'),
                            ),
                            buildKey(
                              '8',
                              'TUV',
                              onTap: () => _onKeyboardTap('8'),
                            ),
                            buildKey(
                              '9',
                              'WXYZ',
                              onTap: () => _onKeyboardTap('9'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            buildKey('0', '', onTap: () => _onKeyboardTap('0')),
                            Expanded(
                              child: InkWell(
                                onTap: _onBackspace,
                                child: const Icon(
                                  Icons.backspace,
                                  size: 28,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/Line.png', height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
