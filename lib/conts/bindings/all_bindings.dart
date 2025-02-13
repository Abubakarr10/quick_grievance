
import 'package:get/get.dart';
import 'package:quick_grievance/screens/auth/hostelite/login/LoginController.dart';
import 'package:quick_grievance/screens/entryPoint/EntryPointController.dart';
import 'package:quick_grievance/screens/entryPoint/entry_point_screen.dart';
import 'package:quick_grievance/screens/profile/profile_screen/ProfileController.dart';
import 'package:quick_grievance/screens/splash/SplashController.dart';

import '../../screens/auth/hostelite/signup/SignUpController.dart';

class AllBindings implements Bindings{

  AllBindings ();
  @override
  Future dependencies() async {
    Get.lazyPut(()=> SplashController());
    Get.lazyPut(()=> SignUpController());
    Get.lazyPut(()=> LoginController());
    Get.lazyPut(()=> EntryPointController());
    Get.lazyPut(()=> ProfileController());
  }

}