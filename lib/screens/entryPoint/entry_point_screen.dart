import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/screens/entryPoint/EntryPointController.dart';
import 'package:quick_grievance/screens/profile/profile_screen/profile_screen.dart';
import 'package:rive/rive.dart';

import '../../conts/app_colors.dart';
import '../../model/menu_model.dart';
import '../../utils/rive_utils.dart';
import '../home/home_screen.dart';
import 'widgets/widgets.dart';


class EntryPointScreen extends StatefulWidget {
  const EntryPointScreen({super.key});

  @override
  State<EntryPointScreen> createState() => _EntryPointScreenState();
}

class _EntryPointScreenState extends State<EntryPointScreen>
    with SingleTickerProviderStateMixin {


  Menu selectedSideMenu = sidebarMenus.first;

  late SMIBool isMenuOpenInput;


  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
   var controller = Get.put(EntryPointController());
   // int changeIndex = Get.arguments['index']?? 5;
   // bool isBackUse = Get.arguments['isBackUse'] ?? false;

   return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: secondaryColor,
      body: Stack(
        children: [

          // Side Menu Bar
          AnimatedPositioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: controller.isSideBarOpen.value ? 0 : -288,
            top: 0,
            child: const SideBar(),
          ),

          // Main Page Content
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                  1 * animation.value - 30 * (animation.value) * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: Obx(()=>
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25)
                      ),
                      child: controller.isSideMenuOpen.value == true?
                      controller.sideBarMenuPages.elementAt(controller.sidePageNo.value)
                      :
                      controller.bottomNavPages.elementAt(controller.pageNo.value),
                    )
                ),
              ),
            ),
          ),
          
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: controller.isSideBarOpen.value ? 220 : 0,
            top: 1,
            child: Obx(()=>
                Visibility(
              visible: controller.pageNo.value == 0 ? true : false,
              child: MenuBtn(
                press: () {

                  isMenuOpenInput.value = !isMenuOpenInput.value;



                  if (_animationController.value == 0) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }

                  controller.isSideBarOpen.value = !controller.isSideBarOpen.value;


                },
                riveOnInit: (artBoard) {
                  final controller = StateMachineController.fromArtboard(
                      artBoard, "State Machine");

                  artBoard.addController(controller!);

                  isMenuOpenInput =
                  controller.findInput<bool>("isOpen") as SMIBool;
                  isMenuOpenInput.value = true;
                },
              ),
            )),
          ),

        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Visibility(
        visible: controller.sidePageNo.value == 0? true : false,
        child: Transform.translate(
          offset: Offset(0, 100 * animation.value),
          child: SafeArea(
            child: Container(
              padding:
                  const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: secondaryColor,
                    offset: Offset(0, 20),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      bottomNavItems.length,
                      (index) {
                        Menu navBar = bottomNavItems[index];
                        return Obx(()=>
                            BtmNavItem(
                              navBar: navBar,
                              press: () {
                                RiveUtils.changeSMIBoolState(navBar.rive.status!);
                                controller.updateSelectedBtmNav(navBar);
                                controller.pageNo.value = index;
                              },
                              riveOnInit: (artBoard) {
                                navBar.rive.status = RiveUtils.getRiveInput(artBoard,
                                    stateMachineName: navBar.rive.stateMachineName);
                              },
                              selectedNav: bottomNavItems[controller.pageNo.value],
                            )
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
