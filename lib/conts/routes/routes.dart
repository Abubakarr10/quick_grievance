import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/entryPoint/entry_point_screen.dart';
import 'package:quick_grievance/screens/history/history_screen.dart';
import 'package:quick_grievance/screens/mess/mess_screen.dart';
import 'package:quick_grievance/screens/onBoarding/onboarding_screen.dart';
import 'package:quick_grievance/screens/profile/profile_screen/profile_screen.dart';
import 'package:quick_grievance/screens/slip_exit/slip_exit_screen.dart';

import '../../screens/home/home_screen.dart';


// Routes
final pages = [

  GetPage(name: initialScreen, page: () => const MessScreen()),

  ///======================== Onboarding Routes ================================
  GetPage(name: onBoardingScreen, page: () => const OnBoardingScreen()),

  ///========================= EntryPoint Routes ===============================
  GetPage(name: entryPointScreen, page: () => const EntryPointScreen()),

  ///========================== Home Routes ====================================
  GetPage(name: homeScreen, page: () => const HomeScreen()),

];