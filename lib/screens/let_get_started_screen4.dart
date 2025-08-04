import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'welcome_screen.dart';

class LetGetStartedScreen4 extends StatefulWidget {
  final String verificationId;

  const LetGetStartedScreen4({super.key, required this.verificationId});

  @override
  State<LetGetStartedScreen4> createState() => _LetGetStartedScreen4State();
}

class _LetGetStartedScreen4State extends State<LetGetStartedScreen4> {
  List<String> code = ['', '', '', '', '', ''];
  int currentIndex = 0;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _onKeyboardTap(String value) {
    setState(() {
      if (currentIndex < 6) {
        code[currentIndex] = value;
        if (currentIndex < 5) currentIndex++;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (currentIndex > 0 && code[currentIndex] == '') {
        currentIndex--;
      }
      code[currentIndex] = '';
    });
  }

  bool get isCodeComplete => !code.contains('');

  void _continue() async {
    if (isCodeComplete) {
      String smsCode = code.join('');
      print("Entered Code: $smsCode");

      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: smsCode,
        );

        await _auth.signInWithCredential(credential);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification successful!')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid code. Please try again.')),
        );
        print("Verification Error: $e");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the complete code')),
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

  Widget buildCodeBox(int index) {
    bool isActive = currentIndex == index;
    bool isFilled = code[index].isNotEmpty;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isActive || isFilled ? Colors.blue : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          code[index],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  const SizedBox(height: 40),
                  const Center(
                    child: Text(
                      'Enter the 6-digit code',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) => buildCodeBox(index)),
                  ),
                  const SizedBox(height: 24),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Didn't receive the code? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "Resend code",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: _continue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCodeComplete
                            ? Colors.blueAccent
                            : const Color(0xFFC7EFFF),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Colors.blueAccent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Continue',
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
          ),

          // Grey keypad
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
