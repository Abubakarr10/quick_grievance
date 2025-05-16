import 'dart:math';

import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/auth/hostelite/signup/signup_screen.dart';
import 'package:quick_grievance/screens/auth/warden/warden_join_screen.dart';
import 'package:quick_grievance/screens/entryPoint/entry_point_screen.dart';
import 'package:quick_grievance/screens/history/history_screen.dart';
import 'package:quick_grievance/screens/mess/mess_screen.dart';
import 'package:quick_grievance/screens/mess/vote/vote_screen.dart';
import 'package:quick_grievance/screens/onBoarding/onboarding_screen.dart';
import 'package:quick_grievance/screens/profile/logout/logout_screen.dart';
import 'package:quick_grievance/screens/profile/profile_screen/profile_screen.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/edit_user_account/edit_user_account_screen.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/theme/theme_screen.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/user_account/user_account_screen.dart';
import 'package:quick_grievance/screens/slip_exit/slip_exit_screen.dart';
import 'package:quick_grievance/screens/splash/splash_screen.dart';

import '../../screens/auth/hostelite/login/login_screen.dart';
import '../../screens/home/home_screen.dart';


// Routes
final pages = [

  GetPage(name: initialScreen, page: () => const SplashScreen()),

  ///======================== Onboarding Routes ================================
  GetPage(name: onBoardingScreen, page: () => const OnBoardingScreen()),

  ///========================== Auth Routes ====================================
  GetPage(name: signUpScreen, page: () => const SignUpScreen()),
  GetPage(name: loginScreen, page: () => const LoginScreen()),

  GetPage(name: wardenScreen, page: () => const WardenJoinScreen()),

  ///========================= EntryPoint Routes ===============================
  GetPage(name: entryPointScreen, page: () => const EntryPointScreen()),

  ///========================== Home Routes ====================================
  GetPage(name: homeScreen, page: () => const HomeScreen()),

  ///======================== Slip Exit Routes =================================
  GetPage(name: slipExitScreen, page: () => const SlipExitScreen()),

  ///========================== Mess Routes ====================================
  GetPage(name: messScreen, page: () => const MessScreen()),
  GetPage(name: voteScreen, page: () => const VoteScreen()),

  ///========================== Complain Routes=================================
 // GetPage(name: homeScreen, page: () => const HomeScreen()),

  ///========================== History Routes =================================
  GetPage(name: historyScreen, page: () => const HistoryScreen()),

  ///========================== Profile Routes =================================
  GetPage(name: profileScreen, page: () => const ProfileScreen()),
  GetPage(name: userAccountScreen, page: () => const UserAccountScreen()),
  GetPage(name: editUserAccountScreen, page: () => const EditUserAccountScreen()),
  GetPage(name: themeScreen, page: () => const ThemeScreen()),
  GetPage(name: logoutScreen, page: () => const LogoutScreen()),
];