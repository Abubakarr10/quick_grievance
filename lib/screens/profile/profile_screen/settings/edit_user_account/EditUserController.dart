
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/repository/share_preferences/sp_controller.dart';

import '../../../../../model/user_model.dart';

class EditUserController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserModel? userData;

  final formKey = GlobalKey<FormState>();

  RxBool isLoading = true.obs;

  late TextEditingController fullNameController;
  late TextEditingController phoneNoController;
  late TextEditingController roomNoController;
  late TextEditingController degreeController;
  late TextEditingController batchController;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      final doc = await _firestore.collection('users').doc(currentUserId).get();

      if (doc.exists) {
        userData = UserModel.fromFirestore(doc);

        fullNameController = TextEditingController(text: userData!.fullName);
        roomNoController = TextEditingController(text: userData!.roomNo);
        phoneNoController = TextEditingController(text: userData!.phoneNo);
        degreeController = TextEditingController(text: userData!.degree);
        batchController = TextEditingController(text: userData!.batch);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading user: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateUser(String docId) async {
    if(formKey.currentState!.validate()){
      isLoading.value = true;
      try {
        await FirebaseFirestore.instance.collection('users').doc(docId).update({
          'full_name': fullNameController.text.trim(),
          'phone_no': phoneNoController.text.trim(),
          'room_no': roomNoController.text.trim(),
          'degree': degreeController.text.trim(),
          'batch': batchController.text.trim(),
        });

        isLoading.value = false;

        Get.snackbar('Success', 'User updated successfully!');

        Get.offNamed(entryPointScreen,arguments: {
          'index': 4,
        });
      } catch (e) {
        Get.snackbar('Error', 'Failed to update user: $e');
      }
    }
  }


}