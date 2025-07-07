import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/repository/share_preferences/sp_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../conts/routes/screen_names.dart';
import '../../../../../model/user_model.dart';
import '../../../../../repository/auth_service.dart';

class UserController extends GetxController {
  var user = Rxn<UserModel>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isLoading = true.obs;
  RxBool isUserLoaded = false.obs;

  // Future<void> gettingUserData() async {
  //   final uid = FirebaseAuth.instance.currentUser;
  //   if (uid != null) {
  //     final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //     if (doc.exists) {
  //       user.value = UserModel.fromFirestore(doc);
  //       isUserLoaded.value = true;
  //     }
  //   }
  // }

  final authService = AuthService();
  late SharedPreferences prefs;

  @override
  void onInit() async{
    super.onInit();
    //final currentUser = FirebaseAuth.instance.currentUser!.uid;
    await fetchUserData(currentUserId);

  }


  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  Future<void> loadUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (snapshot.exists) {
      currentUser.value = UserModel.fromJson(snapshot.data()!);
    }
  }

  Future<void> fetchUserData(uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      user.value = UserModel.fromFirestore(doc);
      isLoading.value = false;
      if (kDebugMode) {
        print(user.value);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user data');
    }
  }

 // Optionally, to auto-refresh with real-time updates:
  void listenToUserData(String uid) {
    _firestore.collection('users').doc(uid).snapshots().listen((doc) {
      user.value = UserModel.fromFirestore(doc);
    });
  }

  Future<void> logoutAccount()async{
    await authService.logout();
    await saveLoginStatus(false);
    Get.offAllNamed(onBoardingScreen);
  }
}
