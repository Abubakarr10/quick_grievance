import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/screens/complain/complain_screen.dart';
import 'package:quick_grievance/screens/history/history_screen.dart';
import 'package:quick_grievance/screens/home/home_screen.dart';
import 'package:quick_grievance/screens/mess/mess_screen.dart';
import 'package:quick_grievance/screens/notification/notification_screen.dart';
import 'package:quick_grievance/screens/profile/profile_screen/profile_screen.dart';
import 'package:quick_grievance/screens/slip_exit/slip_screen.dart';

import '../../model/menu_model.dart';
import '../community/community_screen.dart';

class EntryPointController extends GetxController{


RxInt pageNo = 0.obs;
RxInt sidePageNo = 0.obs;
RxBool isSideMenuOpen = false.obs;
RxBool isSideBarOpen = false.obs;


Rx<Menu> selectedButtonNav = bottomNavItems.first.obs;

Rx<Menu> selectedSideMenu = sidebarMenus.first.obs;

  List<Widget> bottomNavPages = [
    const HomeScreen(),
    const CommunityScreen(backoff: true,),
    const NotificationScreen(backoff: true),
    const HistoryScreen(backoff: true,),
    const ProfileScreen(),
  ];

  List<Widget> sideBarMenuPages = [
    const HomeScreen(),
    const ProfileScreen(),
    const SlipScreen(backoff: true,),
    const CommunityScreen(backoff: true,),
    const HistoryScreen(backoff: true,),
    const NotificationScreen(backoff: true),
  ];


void updateSelectedBtmNav(Menu menu) {
  if (selectedButtonNav.value != menu) {

      selectedButtonNav.value = menu;

  }
}

}