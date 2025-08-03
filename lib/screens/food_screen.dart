import 'package:flutter/material.dart';
import 'media_screen.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final TextEditingController foodController = TextEditingController();

  final List<String> tags = [
    '#Chai&chill',
    '#Coffeeismylovelanguage',
    '#Dal-chawalloyalist',
    '#Pizzaispersonality',
    '#Dessertbeforedinner',
    '#Streetfoodislife',
    '#Midnightsnacker',
    '#Finedining',
    '#Momos>everything',
    '#Notafussyeater',
    '#Ilivetoeat',
    '#Tryingeverycuisineonce',
  ];

  final Set<String> selectedTags = {};

  void toggleTag(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        if (selectedTags.length < 3) {
          selectedTags.add(tag);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ✅ Linear Progress (3rd screen of 5)
          SizedBox(
            height: 3,
            width: double.infinity,
            child: LinearProgressIndicator(
              value: 3 / 5,
              minHeight: 3,
              color: Colors.orange.shade300,
              backgroundColor: Colors.orange.shade100,
            ),
          ),

          // ✅ Expanded: Scrollable Content
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Back arrow + heading
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
                          'Your Food Vibe',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Food you love:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ✅ Multi-line TextField
                    SizedBox(
                      width: screenWidth * 0.85,
                      child: TextField(
                        controller: foodController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Type here...',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.lightBlueAccent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.lightBlueAccent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Pick up to 3 tags that match your vibe',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: tags.map((tag) {
                        final bool isSelected = selectedTags.contains(tag);
                        return GestureDetector(
                          onTap: () => toggleTag(tag),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFFFD6A5)
                                  : Colors.white,
                              border: isSelected
                                  ? null
                                  : Border.all(color: Colors.lightBlueAccent),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ✅ Fixed Bottom Buttons
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                SizedBox(
                  width: screenWidth * 0.65,
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
                          builder: (context) => const MediaScreen(),
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
                const SizedBox(height: 12),
                SizedBox(
                  width: screenWidth * 0.65,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.lightBlueAccent),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MediaScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Skip',
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
        ],
      ),
    );
  }
}
