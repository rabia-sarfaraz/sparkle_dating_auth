import 'package:flutter/material.dart';
import 'word_trail1_screen.dart';

class WordTrailScreen extends StatefulWidget {
  const WordTrailScreen({super.key});

  @override
  State<WordTrailScreen> createState() => _WordTrailScreenState();
}

class _WordTrailScreenState extends State<WordTrailScreen> {
  static const int rows = 6;
  static const int columns = 15;

  final List<List<TextEditingController>> controllers = List.generate(
    rows,
    (_) => List.generate(columns, (_) => TextEditingController()),
  );
  final List<bool> rowActive = List.filled(rows, false);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    const Color boxColor = Colors.white;
    const Color outlineColor = Color(0xFFFFD6A5);
    const Color borderColor = Color(0xFFA2A0A0);
    const Color filledRowColor = Color(0xFFCCCCCC);
    const Color filledCellColor = Color(0xFF9BD895);
    const Color playButtonColor = Color(0xFFC7EFFF);
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
                  const Text(
                    'Word Trail with Rohan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  'Using a letter from their name, play a word that’s you.',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your personality, current mood, a fav thing, a fleeting thought – whatever feels right',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Main Box
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: outlineColor, width: 3),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/images/box_icon.png',
                      height: 30,
                    ),
                  ),
                  const SizedBox(height: 8),

                  SizedBox(
                    height: 240,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      child: Row(
                        children: List.generate(columns, (col) {
                          return Column(
                            children: List.generate(rows, (row) {
                              final controller = controllers[row][col];
                              final bool isActive = rowActive[row];
                              final bool isFilled = controller.text.isNotEmpty;

                              final Color bgColor = isActive
                                  ? filledRowColor
                                  : Colors.white;
                              final Color cellColor = isFilled
                                  ? filledCellColor
                                  : bgColor;

                              return Container(
                                width: 31,
                                height: 31,
                                margin: const EdgeInsets.all(2),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: cellColor,
                                  border: Border.all(color: borderColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextField(
                                  controller: controller,
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  showCursor: false,
                                  style: TextStyle(
                                    color: isFilled
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  decoration: const InputDecoration(
                                    counterText: '',
                                    border: InputBorder.none,
                                    isCollapsed: true,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  onChanged: (val) {
                                    if (val.isNotEmpty) {
                                      setState(() {
                                        controllers[row][col].text = val[0]
                                            .toUpperCase();
                                        rowActive[row] = true;

                                        if (col + 1 < columns) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      });
                                    }
                                  },
                                ),
                              );
                            }),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Image.asset('assets/images/bottom_icon.png', height: 50),
                  const SizedBox(height: 12),

                  SizedBox(
                    width:
                        MediaQuery.of(context).size.width *
                        0.85, // ✅ Width less
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WordTrail1Screen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: playButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Play',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    child: ListView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: columns * 35,
                          height: 4,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),

                  const Icon(Icons.keyboard_arrow_down, size: 28),
                ],
              ),
            ),

            const Spacer(), // ✅ Push bottom nav bar at bottom always

            Container(
              margin: const EdgeInsets.only(bottom: 8),
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
          ],
        ),
      ),
    );
  }
}
