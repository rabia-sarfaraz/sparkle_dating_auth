import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'location1_screen.dart';

class AboutYou2Screen extends StatefulWidget {
  const AboutYou2Screen({super.key});

  @override
  State<AboutYou2Screen> createState() => _AboutYou2ScreenState();
}

class _AboutYou2ScreenState extends State<AboutYou2Screen> {
  int selectedDay = 1;
  String selectedMonth = 'January';
  int selectedYear = DateTime.now().year;

  final List<int> days = List.generate(31, (index) => index + 1);
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final List<int> years = List.generate(
    50,
    (index) => DateTime.now().year - index,
  );

  int calculateAge() {
    DateTime today = DateTime.now();
    DateTime birthday = DateTime(
      selectedYear,
      months.indexOf(selectedMonth) + 1,
      selectedDay,
    );
    int age = today.year - birthday.year;
    if (today.month < birthday.month ||
        (today.month == birthday.month && today.day < birthday.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    final age = calculateAge();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar top
            LinearProgressIndicator(
              value: 2 / 6,
              minHeight: 3,
              color: Colors.orange.shade300,
              backgroundColor: Colors.orange.shade100,
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
                    // Back arrow + About You
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
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      '• Add Your Birthdate*',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Pickers occupy full space
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(
                                initialItem: days.indexOf(selectedDay),
                              ),
                              itemExtent: 40,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  selectedDay = days[index];
                                });
                              },
                              selectionOverlay: Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent.withOpacity(
                                    0.2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              children: days
                                  .map(
                                    (d) => Center(
                                      child: Text(
                                        d.toString(),
                                        style: TextStyle(
                                          color: d == selectedDay
                                              ? Colors.black
                                              : Colors.orange,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          Expanded(
                            child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(
                                initialItem: months.indexOf(selectedMonth),
                              ),
                              itemExtent: 40,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  selectedMonth = months[index];
                                });
                              },
                              selectionOverlay: Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent.withOpacity(
                                    0.2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              children: months
                                  .map(
                                    (m) => Center(
                                      child: Text(
                                        m,
                                        style: TextStyle(
                                          color: m == selectedMonth
                                              ? Colors.black
                                              : Colors.orange,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          Expanded(
                            child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(
                                initialItem: 0,
                              ),
                              itemExtent: 40,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  selectedYear = years[index];
                                });
                              },
                              selectionOverlay: Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent.withOpacity(
                                    0.2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              children: years
                                  .map(
                                    (y) => Center(
                                      child: Text(
                                        y.toString(),
                                        style: TextStyle(
                                          color: y == selectedYear
                                              ? Colors.black
                                              : Colors.orange,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Age + Info + Button at bottom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.lightBlueAccent,
                          thickness: 2,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'You are $age years old',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Divider(
                          color: Colors.lightBlueAccent,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.info_outline, color: Colors.black),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Only your age will be shown on your profile — never your full birthdate.',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
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
                            builder: (context) => const Location1Screen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 16,
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
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
