import 'package:flutter/material.dart';
import 'food_screen.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final TextEditingController musicController = TextEditingController();

  final List<String> tags = [
    '#DesiBeats',
    '#SoulfulTunes',
    '#EDMJunkie',
    '#BollywoodClassics',
    '#HipHopHead',
    '#GhazalMood',
    '#IndieForever',
    '#ClassicalCalm',
    '#RainyDayPlaylists',
    '#PopAddict',
    '#DanceItOut',
    '#SadSongsHitHard',
    '#FeelGoodTunes',
    '#RoadTripPlaylist',
    '#ClassicRockhead',
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

      // ✅ TOP LINEAR PROGRESS OUTSIDE SAFEAREA
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                value: 2 / 5,
                minHeight: 3,
                color: Colors.orange.shade300,
                backgroundColor: Colors.orange.shade100,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Back + Heading
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Your Music Vibe',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Your musical taste',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ✅ Rounded TextField with placeholder bold + grey
                    Container(
                      width: screenWidth * 0.85,
                      child: TextField(
                        controller: musicController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText:
                              'Artists, songs, genres — whatever you vibe with',
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
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.lightBlueAccent,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 20,
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

                    const SizedBox(
                      height: 100,
                    ), // Extra space so scroll doesn't hide content
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // ✅ ALWAYS AT BOTTOM
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    MaterialPageRoute(builder: (context) => const FoodScreen()),
                  );

                  /// TODO: Continue
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
                    MaterialPageRoute(builder: (context) => const FoodScreen()),
                  );

                  /// TODO: Skip
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
    );
  }
}
