import 'package:flutter/material.dart';
import 'word_trail_new_screen.dart';

class Inbox2Screen extends StatefulWidget {
  const Inbox2Screen({super.key});

  @override
  State<Inbox2Screen> createState() => _Inbox2ScreenState();
}

class _Inbox2ScreenState extends State<Inbox2Screen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {'fromMe': true, 'text': 'Fancy the Cozy\nescape?'},
    {'fromMe': false, 'text': 'Absolutely! and\nsamosa?'},
    {'fromMe': true, 'text': "Only if you're sharing\nthe umbrella."},
  ];

  bool isTyping = false;

  void sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({'fromMe': true, 'text': text});
      _controller.clear();
      isTyping = false;

      // Simulated reply
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          messages.add({
            'fromMe': false,
            'text': "hi Rabia, I'm good. How are you?",
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color myMessageColor = Color(0xFFFFF6E6);
    const Color theirMessageColor = Color(0xFFFFD6A5);
    const Color micBgColor = Color(0xFFFFD6A5);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Top Bar with AI Navigator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/rohan1.png'),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Rohan',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/ai_icon.png',
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordTrailNewScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade200,
                      ),
                      child: const Text(
                        'AI',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ✅ Chat Messages
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final isMe = msg['fromMe'] as bool;
                  final bgColor = isMe ? myMessageColor : theirMessageColor;
                  final align = isMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start;

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      crossAxisAlignment: align,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            msg['text'],
                            textAlign: isMe ? TextAlign.right : TextAlign.left,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ✅ Input Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              onChanged: (val) {
                                setState(() {
                                  isTyping = val.trim().isNotEmpty;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'Message',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.image, color: Colors.grey),
                            onPressed: () {
                              debugPrint('Image picker tapped');
                            },
                          ),
                          IconButton(
                            icon: isTyping
                                ? const Icon(Icons.send, color: Colors.grey)
                                : const SizedBox.shrink(),
                            onPressed: isTyping ? sendMessage : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      debugPrint('Voice record tapped');
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: micBgColor,
                      ),
                      padding: const EdgeInsets.all(14),
                      child: const Icon(Icons.mic, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
