import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

import '../../../model/mess_model.dart';

class AdminController extends GetxController {
 // RxBool isDarkMode = false.obs;

  RxInt selectedIndex = 0.obs;

//  void toggleTheme() => isDarkMode.value = !isDarkMode.value;

  List<String> get navTitles => [
    'Dashboard',
    'Slip Requests',
    'Complaints',
    'Mess',
    'Approve Users',
    'Settings',
  ];

  RxInt pendingSlipsCount = 0.obs;
  RxInt unAuthorizedUserCount = 0.obs;
  RxInt pendingComplaintsCount = 0.obs;
  RxString todaysMenu = ''.obs;

  @override
  void onInit() {
    super.onInit();
    listenToPendingSlips();
    listenToPendingComplaints();
    listenToTodayMess();
    listenToUnAuthorizedUser();

    final int? argIndex = Get.arguments as int?;
    if (argIndex != null) {
      selectedIndex.value = argIndex;
    }
  }

  void listenToUnAuthorizedUser() {
    FirebaseFirestore.instance
        .collection('users')
        .where('isAuthorized', isEqualTo: 'false')
        .snapshots()
        .listen((snapshot) {
      unAuthorizedUserCount.value = snapshot.docs.length;
    });
  }


  void listenToPendingSlips() {
    FirebaseFirestore.instance
        .collection('request_slip_exit')
        .where('status')
        .snapshots()
        .listen((snapshot) {
      pendingSlipsCount.value = snapshot.docs.length;
    });
  }

  void listenToPendingComplaints() {
    FirebaseFirestore.instance
        .collection('complaint')
        .where('status', isEqualTo: 'Pending')
        .snapshots()
        .listen((snapshot) {
      pendingComplaintsCount.value = snapshot.docs.length;
    });
  }

  void listenToTodayMess() {

    FirebaseFirestore.instance
        .collection('mess')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final data = MessModel.fromJson(snapshot.docs.first.data());
        todaysMenu.value = '${data.optionA} | ${data.optionB}';
      } else {
        todaysMenu.value = 'No Menu';
      }
    });
  }
}
