import 'package:flutter/material.dart';
import 'my_profile_screen.dart'; // ✅ Make sure this import path is correct!

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    const Text(
                      'View Profile',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ✅ Full width image
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/rohan_profile.png',
                  fit: BoxFit.cover,
                ),
              ),

              Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rohan, 28',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Architect',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

                    const Text(
                      'Bio',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "My name is Rohan. I'm a driven and thoughtful individual, currently focused on building my career as an Architect. I believe in continuous self-improvement, both personally and professionally, and approach life with a positive outlook and a desire to learn.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Family and faith are at the core of who I am. I strive to live a balanced life. You'll find me someone who values sincerity, respect, and open communication. I'm a non-smoker and live a fun yet disciplined lifestyle, seeking a partner who shares similar easy going personality traits.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "I'm looking for a genuine connection with someone who is compassionate, ambitious, and has a great sense of humor. I appreciate meaningful conversations and someone who is also eager to build a life filled with mutual growth, understanding, and joy.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'More About Me',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      '. A word that describes me',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text('Night Owl', style: TextStyle(fontSize: 14)),

                    const SizedBox(height: 20),

                    const Text(
                      '. My unpopular opinion',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Street food is superior than anything else',
                      style: TextStyle(fontSize: 14),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      '. If we date, prepare for...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Laughing till our tummies hurt!',
                      style: TextStyle(fontSize: 14),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      '. My musical taste',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildTag('#BollywoodClassics'),
                        _buildTag('#FeelGoodTunes'),
                        _buildTag('#SoulfulTunes'),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      '. My food vibe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildTag('#Momos>everything'),
                        _buildTag('#Chai&chill'),
                        _buildTag('#Dessertbeforedinner'),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      '. My TV,Books, or Game Picks',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "If it's a Bollywood romcom starring Shah Rukh Khan – like Dilwale Dulhania Le Jayenge or Kabhi Khushi Kabhie Gham – chances are it's on my re-watch list, especially with classic tunes like \"Tujhe Dekha Toh\" playing! Beyond that, I love diving into engaging narratives in books, enjoying the witty charm of a romance like The Hating Game or the suspense of a thriller like The Guest List. And for unwinding, it's all about fun, easygoing games that offer a good laugh.",
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      '. My overall vibe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildTag('introvertish'),
                        _buildTag('old soul in a young world'),
                        _buildTag('bollywood baby'),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),

              // ✅ Bottom Button with Icon on Right
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyProfileScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC7EFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Let's Spark",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9CF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }
}
