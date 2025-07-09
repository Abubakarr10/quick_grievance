import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';

import '../../model/complaint_model.dart';
import '../../model/notification_model.dart';
import '../../model/slip_exit_model.dart';

class NotificationController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<SlipExitModel?> fetchSlipExitById(String typeId,type) async {
    if(type == 'Slip Rejected' ){
      try {
        final doc = await _firestore
            .collection('reject_slip_exit')
            .doc(typeId)
            .get();
        if (doc.exists && doc.data() != null) {
          return SlipExitModel.fromJson(doc.data()!);
        } else {
          if (kDebugMode) {
            print('Slip not found for ID: $typeId');
          }
          return null;
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching slip by ID: $e');
        }
        return null;
      }
    }else{
      try {
        final doc = await _firestore
            .collection('approve_slip_exit')
            .doc(typeId)
            .get();
        if (doc.exists && doc.data() != null) {
          return SlipExitModel.fromJson(doc.data()!);
        } else {
          if (kDebugMode) {
            print('Slip not found for ID: $typeId');
          }
          return null;
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching slip by ID: $e');
        }
        return null;
      }
    }
  }

  void moveToTokenScreen(String typeId,type) async {
    SlipExitModel? data = await fetchSlipExitById(typeId,type);

    if (data != null) {
      Get.offNamed(slipTokenScreen, arguments: {
        'slipData': data,
        'backTo': notificationScreen,
        'slipId': typeId,
      });
    } else {
      Get.snackbar('Error', 'Slip not found or deleted.');
    }
  }

  Future<ComplaintModel?> fetchComplaintById(String complaintId) async {
    try {
      final doc = await _firestore
          .collection('complaint')
          .doc(complaintId)
          .get();

      if (doc.exists && doc.data() != null) {
        return ComplaintModel.fromJson(doc.data()!);
      } else {
        if (kDebugMode) {
          print('Complaint not found for ID: $complaintId');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching complaint by ID: $e');
      }
      return null;
    }
  }

  void moveToComplaintDetail(String complaintId) async {
    ComplaintModel? data = await fetchComplaintById(complaintId);

    if (data != null) {
      Get.offNamed(complaintDetailScreen, arguments: {
        'data': data,
        'docId': complaintId,
      });
    } else {
      Get.snackbar('Error', 'Complaint not found or may have been deleted.');
    }
  }


  Stream<List<NotificationModel>> getUserNotifications(String uid) {
    return FirebaseFirestore.instance
        .collection('notifications')
        .where('userId', isEqualTo: uid)
        .orderBy('dateTime', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => NotificationModel.fromJson(doc.data())).toList());
  }


}