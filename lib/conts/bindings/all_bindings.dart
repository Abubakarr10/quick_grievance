
import 'package:get/get.dart';
import 'package:quick_grievance/screens/auth/hostelite/login/LoginController.dart';
import 'package:quick_grievance/screens/community/add_post/AddPostController.dart';
import 'package:quick_grievance/screens/complain/ComplainController.dart';
import 'package:quick_grievance/screens/entryPoint/EntryPointController.dart';
import 'package:quick_grievance/screens/entryPoint/entry_point_screen.dart';
import 'package:quick_grievance/screens/home/HomeController.dart';
import 'package:quick_grievance/screens/profile/profile_screen/ProfileController.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/user_account/user_account_screen.dart';
import 'package:quick_grievance/screens/slip_exit/SlipExitController.dart';
import 'package:quick_grievance/screens/splash/SplashController.dart';

import '../../screens/auth/hostelite/signup/SignUpController.dart';
import '../../screens/community/CommunityController.dart';
import '../../screens/profile/logout/LogoutController.dart';
import '../../screens/profile/profile_screen/settings/user_account/UserAccountController.dart';

class AllBindings implements Bindings{

  AllBindings ();
  @override
  Future dependencies() async {
    Get.lazyPut(()=> SplashController());
    Get.lazyPut(()=> SignUpController());
    Get.lazyPut(()=> LoginController());
    Get.lazyPut(()=> EntryPointController());
    Get.lazyPut(()=> HomeController());
    Get.lazyPut(()=> ProfileController());
    Get.lazyPut(()=> UserAccountController());
    Get.lazyPut(()=> SlipExitController());
    Get.lazyPut(()=> LogoutController());
    Get.lazyPut(()=> ComplainController());
    Get.lazyPut(()=> CommunityController());
    Get.lazyPut(()=> AddPostController());
  }

}