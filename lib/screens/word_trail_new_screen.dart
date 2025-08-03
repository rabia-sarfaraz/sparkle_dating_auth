import 'package:flutter/material.dart';
import 'active_row_screen.dart';

class WordTrailNewScreen extends StatefulWidget {
  const WordTrailNewScreen({super.key});

  @override
  State<WordTrailNewScreen> createState() => _WordTrailNewScreenState();
}

class _WordTrailNewScreenState extends State<WordTrailNewScreen> {
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Top Bar without circle avatar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Rohan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/ai_icon.png',
                    height: 28,
                    width: 28,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ActiveRowScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6),
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

            const SizedBox(height: 32),

            const Center(
              child: Text(
                'Your Word Trail With Rohan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Main Grid Box
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

                  // ✅ Horizontal Scroll Line
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
