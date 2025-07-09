import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/admin/complaint/admin_complaint_screen.dart';

import '../../../conts/notification_menthod.dart';
import '../../../model/complaint_model.dart';

class AdminComplainController extends GetxController{

  RxString docId = ''.obs;
  RxInt index = 0.obs;

  RxString complainStatus = 'Pending'.obs;

  RxString selectedFilter = 'All'.obs;

  Stream<List<ComplaintModel>> getComplaintsStream() {
    if (selectedFilter.value == 'All') {
      return FirebaseFirestore.instance
          .collection('complaint')
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => ComplaintModel.fromJson(doc.data()))
          .toList());
    } else {
      return FirebaseFirestore.instance
          .collection('complaint')
          .where('status', isEqualTo: selectedFilter.value)
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => ComplaintModel.fromJson(doc.data()))
          .toList());
    }
  }

  void updateFilter(String filter) {
    selectedFilter.value = filter;
  }

  List<String> complainStatusList = [
    'Pending',
    'In-Process',
    'Resolved',
    'Rejected',
  ];

  List<IconData> complainStatusIcons = [
    Icons.access_time,
    Icons.sync,
    Icons.check_circle,
    Icons.cancel,
  ];


  Future<void> updateComplaintStatus(docId,ComplaintModel data) async {
    try {
      await FirebaseFirestore.instance
          .collection('complaint')
          .doc(docId)
          .update({'status': complainStatus.value});

      Get.snackbar('Success', 'Complaint status updated',
          colorText: secondaryColor,
          backgroundColor: accentColor,
          snackPosition: SnackPosition.BOTTOM);

      await sendNotificationToUser(
        title: 'Complaint Updated',
        body: 'Your complaint status has been updated to: ${complainStatus.value}',
        userId: data.uid,
        type: 'complaint',
        description: data.description,
        typeId: docId,
      );


      Get.offNamed(adminScreen);

    } catch (e) {
      Get.snackbar('Error', 'Failed to update status: $e',
          colorText: pureWhite,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

}