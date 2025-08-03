import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'your_bio_screen.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({super.key});

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  XFile? profileImage;
  final List<XFile?> extraImages = List.generate(5, (_) => null);
  final List<TextEditingController> captions = List.generate(
    5,
    (_) => TextEditingController(),
  );

  final picker = ImagePicker();

  Future<void> pickImage(int index) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (index == -1) {
          profileImage = pickedFile;
        } else {
          extraImages[index] = pickedFile;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ✅ Linear progress at absolute top
          SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              value: 5 / 6,
              minHeight: 3,
              color: Colors.orange.shade300,
              backgroundColor: Colors.orange.shade100,
            ),
          ),

          // ✅ Rest of screen inside SafeArea
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    // ✅ Back arrow & heading
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
                          "Let's Set Up Your Profile",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Add up to 6 photos — and feel free to caption each one.*',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),

                    const SizedBox(height: 24),

                    // ✅ Main profile image placeholder
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: profileImage != null
                                ? Image.network(
                                    profileImage!.path,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/images/photo.png',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          const SizedBox(height: 12),
                          OutlinedButton(
                            onPressed: () => pickImage(-1),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.lightBlueAccent,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Add Profile Photo',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ✅ Extra images with caption fields
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => pickImage(index),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: extraImages[index] != null
                                                ? Image.network(
                                                    extraImages[index]!.path,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color:
                                                    extraImages[index] == null
                                                    ? Colors.lightBlueAccent
                                                    : Colors.transparent,
                                                width: 1.5,
                                              ),
                                            ),
                                            child: extraImages[index] == null
                                                ? const Center(
                                                    child: CircleAvatar(
                                                      radius: 10,
                                                      backgroundColor: Colors
                                                          .lightBlueAccent,
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 14,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    controller: captions[index],
                                    decoration: InputDecoration(
                                      hintText: 'Add a caption...',
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.lightBlueAccent,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 8,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ✅ Bottom continue button
                    Center(
                      child: SizedBox(
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
                                builder: (context) => const YourBioScreen(),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
