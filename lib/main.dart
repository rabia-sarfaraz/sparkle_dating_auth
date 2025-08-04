import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';

// ✅ Import your screens here
import 'screens/create_account_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/get_started_screen.dart';
import 'screens/let_get_started_screen1.dart';
import 'screens/let_get_started_screen2.dart';
import 'screens/let_get_started_screen3.dart';
import 'screens/let_get_started_screen4.dart';
import 'screens/welcome_screen.dart';
import 'screens/about_you1_screen.dart';
import 'screens/about_you2_screen.dart';
import 'screens/location1_screen.dart';
import 'screens/location2_screen.dart';
import 'screens/match_preference_screen.dart';
import 'screens/add_image_screen.dart';
import 'screens/your_bio_screen.dart';
import 'screens/custom_background_screen.dart';
import 'screens/prompt_pick_screen.dart';
import 'screens/music_screen.dart';
import 'screens/food_screen.dart';
import 'screens/media_screen.dart';
import 'screens/vibe_screen.dart';
import 'screens/swipe_right_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/word_trail_screen.dart';
import 'screens/word_trail1_screen.dart';
import 'screens/word_trail2_screen.dart';
import 'screens/word_trail3_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/inbox_screen.dart';
import 'screens/inbox2_screen.dart';
import 'screens/word_trail_new_screen.dart';
import 'screens/active_row_screen.dart';
import 'screens/view_profile_screen.dart';
import 'screens/profile_view_screen.dart';
import 'screens/my_profile_screen.dart';
import 'screens/manage_photos_screen.dart';
import 'screens/manage_options_screen.dart';
import 'screens/profile_data_screen.dart';
import 'screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Firebase before runApp
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB0XMCuLF65d-CiJM5VoNMlE3KBAP5lTN0",
      authDomain: "sparkle-dating-auth.firebaseapp.com",
      projectId: "sparkle-dating-auth",
      storageBucket: "sparkle-dating-auth.appspot.com",
      messagingSenderId: "789877790466",
      appId: "1:789877790466:android:4323b07a284e01cc43941b",
    ),
  );

  runApp(const SparkleDatingApp());
}

class SparkleDatingApp extends StatelessWidget {
  const SparkleDatingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sparkle Dating',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFFD6A5),
          secondary: const Color(0xFFFFD6A5),
        ),
        primaryColor: const Color(0xFFFFD6A5),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD6A5),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFFFFD6A5),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/get_started': (context) => const GetStartedScreen(),
        '/create_account': (context) => const CreateAccountScreen(),
        '/let_get_started1': (context) => LetGetStartedScreen1(),
        '/let_get_started2': (context) => LetGetStartedScreen2(),
        '/let_get_started3': (context) => LetGetStartedScreen3(),
        '/let_get_started4': (context) => LetGetStartedScreen4(
          verificationId:
              '', // ✅ Jab navigate karo to sahi verificationId bhejo!
        ),
        '/welcome': (context) => WelcomeScreen(),
        '/about_you1': (context) => const AboutYou1Screen(),
        '/about_you2': (context) => const AboutYou2Screen(),
        '/location1': (context) => const Location1Screen(),
        '/location2': (context) => const Location2Screen(),
        '/match_preference': (context) => const MatchPreferenceScreen(),
        '/add_image': (context) => const AddImageScreen(),
        '/your_bio': (context) => const YourBioScreen(),
        '/custom_background': (context) => CustomBackgroundScreen(),
        '/prompt_pick': (context) => const PromptPickScreen(),
        '/music': (context) => const MusicScreen(),
        '/food': (context) => const FoodScreen(),
        '/media': (context) => const MediaScreen(),
        '/vibe': (context) => const VibeScreen(),
        '/swipe_right': (context) => const SwipeRightScreen(),
        'notification': (context) => const NotificationScreen(),
        'word_trail': (context) => const WordTrailScreen(),
        'word_trail1': (context) => const WordTrail1Screen(),
        'word_trail2': (context) => const WordTrail2Screen(),
        'word_trail3': (context) => const WordTrail3Screen(),
        'payment': (context) => const PaymentScreen(),
        'inbox': (context) => const InboxScreen(),
        'ibox2': (context) => const Inbox2Screen(),
        'word_trail_new': (context) => const WordTrailNewScreen(),
        'active_row': (context) => const ActiveRowScreen(),
        'view_profile': (context) => const ViewProfileScreen(),
        'profile_view': (context) => const ProfileViewScreen(),
        'my_profile': (context) => const MyProfileScreen(),
        'manage_photos': (context) => const ManagePhotosScreen(),
        'manage_options': (context) => const ManageOptionsScreen(),
        'profile_data': (context) => const ProfileDataScreen(),
        'settings': (context) => const SettingsScreen(),
      },
    );
  }
}
