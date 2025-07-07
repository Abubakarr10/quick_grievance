import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/repository/share_preferences/sp_controller.dart';

import '../../model/complaint_model.dart';

class TrackController extends GetxController{

//   Future<Stream<List<ComplaintModel>>> getComplaintsStream() async {
//     return FirebaseFirestore.instance
//         .collection('complaint')
//         .where('uid', isEqualTo: currentUserId)
//         .snapshots()
//         .map((snapshot) => snapshot.docs
//         .map((doc) => ComplaintModel.fromJson(doc.data()))
//         .toList());
//   }
//
 }