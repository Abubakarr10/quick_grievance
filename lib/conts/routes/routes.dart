import 'dart:math';

import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/model/slip_exit_model.dart';
import 'package:quick_grievance/screens/admin/admin_dashboard/dashboard_screen.dart';
import 'package:quick_grievance/screens/admin/complaint/complaint_detail_screen.dart';
import 'package:quick_grievance/screens/admin/mess/add_mess_screen.dart';
import 'package:quick_grievance/screens/admin/mess/mess_detail_screen.dart';
import 'package:quick_grievance/screens/auth/hostelite/signup/signup_screen.dart';
import 'package:quick_grievance/screens/auth/warden/warden_join_screen.dart';
import 'package:quick_grievance/screens/community/add_post/add_post_screen.dart';
import 'package:quick_grievance/screens/community/community_screen.dart';
import 'package:quick_grievance/screens/complain/complain_screen.dart';
import 'package:quick_grievance/screens/entryPoint/entry_point_screen.dart';
import 'package:quick_grievance/screens/history/history_screen.dart';
import 'package:quick_grievance/screens/mess/mess_screen.dart';
import 'package:quick_grievance/screens/mess/vote/vote_screen.dart';
import 'package:quick_grievance/screens/notification/notification_screen.dart';
import 'package:quick_grievance/screens/onBoarding/onboarding_screen.dart';
import 'package:quick_grievance/screens/profile/logout/logout_screen.dart';
import 'package:quick_grievance/screens/profile/profile_screen/profile_screen.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/edit_user_account/edit_user_account_screen.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/theme/theme_screen.dart';
import 'package:quick_grievance/screens/slip_exit/slip_exit_screen.dart';
import 'package:quick_grievance/screens/slip_exit/slip_token_screen.dart';
import 'package:quick_grievance/screens/splash/splash_screen.dart';

import '../../screens/admin/admin_dashboard/admin_screen.dart';

import '../../screens/auth/hostelite/login/login_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/profile/profile_screen/settings/user/user_screen.dart';
import '../../screens/slip_exit/slip_screen.dart';


// Routes
final pages = [

  GetPage(name: initialScreen, page: () =>  const SplashScreen()),

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
  GetPage(name: slipScreen, page: () => const SlipScreen(backoff: false,)),
  GetPage(name: slipExitScreen, page: () => const SlipExitScreen()),
  GetPage(name: slipTokenScreen, page: () => const SlipTokenScreen()),

  ///======================== Complain Routes =================================
  GetPage(name: complainScreen, page: () => const ComplainScreen()),

  ///========================== Mess Routes ====================================
  GetPage(name: messScreen, page: () => const MessScreen()),
  GetPage(name: voteScreen, page: () => const VoteScreen()),

  ///========================== History Routes =================================
  GetPage(name: historyScreen, page: () => const HistoryScreen(backoff: false,)),

  ///========================== Notification Routes =================================
  GetPage(name: historyScreen, page: () => const NotificationScreen(backoff: false,)),

  ///========================== Community Routes =================================
  GetPage(name: communityScreen, page: () => const CommunityScreen(backoff: false,)),
  GetPage(name: addPostScreen, page: () => const AddPostScreen()),

  ///========================== Profile Routes =================================
  GetPage(name: profileScreen, page: () => const ProfileScreen()),
  GetPage(name: userScreen, page: () => const UserScreen()),
  GetPage(name: editUserAccountScreen, page: () => const EditUserAccountScreen()),
  GetPage(name: themeScreen, page: () => const ThemeScreen()),
  GetPage(name: logoutScreen, page: () => const LogoutScreen()),

  ///========================== Admin Routes =================================
  GetPage(name: adminScreen, page: () => const AdminScreen()),
  GetPage(name: addMessScreen, page: () => const AddMessScreen()),
  GetPage(name: messDetailScreen, page: () => const MessDetailScreen()),
  GetPage(name: complaintDetailScreen, page: () => const ComplaintDetailScreen()),

];