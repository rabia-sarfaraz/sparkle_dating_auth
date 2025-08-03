import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File; // Only used for non-web platforms
import 'package:flutter/foundation.dart' show kIsWeb;

import 'manage_options_screen.dart';

class ManagePhotosScreen extends StatefulWidget {
  const ManagePhotosScreen({super.key});

  @override
  State<ManagePhotosScreen> createState() => _ManagePhotosScreenState();
}

class _ManagePhotosScreenState extends State<ManagePhotosScreen> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Top bar with back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.transparent),
                    onPressed: null,
                  ),
                ],
              ),
            ),

            // ✅ Heading & Subtext
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Manage My Photos',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your profile supports up to 6 photos. You may add captions to any of your photos.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ✅ Circle image + button horizontal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: profileImage != null
                        ? (kIsWeb
                              ? NetworkImage(profileImage!.path)
                              : FileImage(File(profileImage!.path)))
                        : const AssetImage('assets/images/ayesha_profile.png')
                              as ImageProvider,
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: () => pickImage(-1),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.lightBlueAccent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Change Profile Photo',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ✅ Text areas with 3-dot menu
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: extraImages[index] != null
                                        ? (kIsWeb
                                              ? Image.network(
                                                  extraImages[index]!.path,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  File(
                                                    extraImages[index]!.path,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ))
                                        : Container(),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: extraImages[index] == null
                                            ? Colors.lightBlueAccent
                                            : Colors.transparent,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: extraImages[index] == null
                                        ? const Center(
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundColor:
                                                  Colors.lightBlueAccent,
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
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // TODO: Add actions for 3 dots
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ✅ Two bottom buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC7EFFF),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // TODO: Save Changes
                      },
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
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
                            builder: (context) => const ManageOptionsScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Manage Options',
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
      ),
    );
  }
}
