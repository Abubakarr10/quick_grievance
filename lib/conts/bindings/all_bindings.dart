
import 'package:get/get.dart';
import 'package:quick_grievance/screens/admin/admin_dashboard/AdminController.dart';
import 'package:quick_grievance/screens/admin/mess/AddMessController.dart';
import 'package:quick_grievance/screens/admin/setting/SettingController.dart';
import 'package:quick_grievance/screens/auth/hostelite/login/LoginController.dart';
import 'package:quick_grievance/screens/auth/warden/WardenJoinController.dart';
import 'package:quick_grievance/screens/community/add_post/AddPostController.dart';
import 'package:quick_grievance/screens/complain/ComplainController.dart';
import 'package:quick_grievance/screens/entryPoint/EntryPointController.dart';
import 'package:quick_grievance/screens/entryPoint/entry_point_screen.dart';
import 'package:quick_grievance/screens/home/HomeController.dart';
import 'package:quick_grievance/screens/mess/vote/VoteController.dart';
import 'package:quick_grievance/screens/profile/profile_screen/ProfileController.dart';
import 'package:quick_grievance/screens/slip_exit/SlipExitController.dart';
import 'package:quick_grievance/screens/splash/SplashController.dart';

import '../../screens/admin/slip_exit/AdminSlipController.dart';
import '../../screens/auth/hostelite/signup/SignUpController.dart';
import '../../screens/community/CommunityController.dart';
import '../../screens/profile/logout/LogoutController.dart';
import '../../screens/profile/profile_screen/settings/user/UserController.dart';

class AllBindings implements Bindings{

  AllBindings ();
  @override
  Future dependencies() async {
    Get.lazyPut(()=> UserController());
    Get.lazyPut(()=> SplashController());
    Get.lazyPut(()=> SignUpController());
    Get.lazyPut(()=> LoginController());
    Get.lazyPut(()=> EntryPointController());
    Get.lazyPut(()=> HomeController());
    Get.lazyPut(()=> ProfileController());
    Get.lazyPut(()=> SlipExitController());
    Get.lazyPut(()=> LogoutController());
    Get.lazyPut(()=> ComplainController());
    Get.lazyPut(()=> CommunityController());
    Get.lazyPut(()=> VoteController());
    // Admin Controllers
    Get.lazyPut(()=> AddPostController());
    Get.lazyPut(()=> AdminController());
    Get.lazyPut(()=> AdminSlipController());
    Get.lazyPut(()=> WardenJoinController());
    Get.lazyPut(()=> SettingController());
    Get.lazyPut(()=> AddMessController());
  }

}