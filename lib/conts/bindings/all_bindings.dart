
import 'package:get/get.dart';

import '../../screens/auth/hostelite/signup/SignUpController.dart';

class AllBindings implements Bindings{

  AllBindings ();
  @override
  Future dependencies() async {
    Get.lazyPut(()=> SignUpController());
  }

}