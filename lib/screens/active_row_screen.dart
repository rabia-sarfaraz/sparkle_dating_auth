import 'package:flutter/material.dart';
import 'view_profile_screen.dart'; // ✅ Corrected import

class ActiveRowScreen extends StatefulWidget {
  const ActiveRowScreen({super.key});

  @override
  State<ActiveRowScreen> createState() => _ActiveRowScreenState();
}

class _ActiveRowScreenState extends State<ActiveRowScreen> {
  static const int rows = 6; // 6 rows
  static const int columns = 15; // 15 columns

  final List<List<TextEditingController>> controllers = List.generate(
    rows,
    (_) => List.generate(columns, (_) => TextEditingController()),
  );

  final ScrollController _scrollController = ScrollController();

  /// Active rows
  final List<bool> rowActive = List.filled(rows, false);

  /// Highlighted next row
  int? nextRowIndex;

  @override
  Widget build(BuildContext context) {
    const Color boxColor = Colors.white;
    const Color outlineColor = Color(0xFFFFD6A5);
    const Color borderColor = Color(0xFFA2A0A0);
    const Color filledRowColor = Color(0xFFCCCCCC);
    const Color nextRowHighlight = Color(0xFFFFD580);
    const Color filledCellColor = Color(0xFF9BD895);
    // const Color playButtonColor = Color(0xFFC7EFFF);
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
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
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
                  'Using a letter from their name, play a word that’s you.',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
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
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    fontSize: 16,
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

                  // ✅ Horizontally scrollable Grid
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

                              Color bgColor;
                              if (isActive) {
                                bgColor = filledRowColor;
                              } else if (nextRowIndex == row) {
                                bgColor = nextRowHighlight;
                              } else {
                                bgColor = Colors.white;
                              }

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
                                  showCursor: false, // ✅ Cursor hidden
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

                                        // ✅ Next row highlight logic
                                        if (row + 1 < rows) {
                                          nextRowIndex = row + 1;
                                        }

                                        // ✅ If already highlighted row is being edited, make it active and highlight next
                                        if (nextRowIndex == row) {
                                          rowActive[row] = true;
                                          nextRowIndex = row + 1 < rows
                                              ? row + 1
                                              : null;
                                        }

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
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ViewProfileScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
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

            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(vertical: 12),
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
