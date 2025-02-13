import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/screens/complain/complain_screen.dart';
import 'package:quick_grievance/screens/history/history_screen.dart';
import 'package:quick_grievance/screens/home/home_screen.dart';
import 'package:quick_grievance/screens/mess/mess_screen.dart';
import 'package:quick_grievance/screens/profile/profile_screen/profile_screen.dart';

class EntryPointController extends GetxController{

RxInt pageNo = 0.obs;

  List<Widget> bottomNavPages = [
    const HomeScreen(),
    const ComplainScreen(),
    const MessScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];


}