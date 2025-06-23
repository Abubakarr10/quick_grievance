import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxInt selectedIndex = 0.obs;
  RxList<String> slips = ['Ali - Sick Leave', 'Sara - Emergency Leave'].obs;
  RxList<String> complaints = ['Room light not working', 'Food quality issue'].obs;
  RxString todaysMenu = 'Rice, Chicken Curry'.obs;

  void toggleTheme() => isDarkMode.value = !isDarkMode.value;

  List<String> get navTitles => ['Dashboard', 'Slip Requests', 'Complaints', 'Mess'];
}
