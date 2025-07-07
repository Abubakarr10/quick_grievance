import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/repository/share_preferences/sp_controller.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import 'package:quick_grievance/screens/home/HomeController.dart';
import 'package:quick_grievance/screens/home/widgets/widgets.dart';




class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(
          spacing: heightX*.012,
          children: [

            Stack(
              children: [
                Image.asset(appBarVector),

                Padding(
                  padding:  EdgeInsets.only(top: heightX*.05),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Greetings with Name
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  StreamBuilder<DocumentSnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(currentUserId)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const Text(''); // or SizedBox()
                                      }

                                      if (snapshot.hasError) {
                                        return const Text('Error loading user');
                                      }

                                      if (!snapshot.hasData || !snapshot.data!.exists) {
                                        return const Text('User not found');
                                      }

                                      final userData = snapshot.data!.data() as Map<String, dynamic>;
                                      final fullName = userData['full_name'] ?? 'User';

                                      return GradientTextWidget(
                                        text: 'Salam! $fullName',
                                        gradient: const LinearGradient(colors: [
                                          accentColor,
                                          primaryColor,
                                        ]),
                                      );
                                    },
                                  ),

                                  AppTextWidget(title: ' 👋🏼',
                                    fontSize: heightX*.024, fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),

                              SizedBox(height: heightX*.01,),

                              // Date and Day7
                              Obx(()=> AppTextWidget(title: controller.formattedDate.value, color: accentColor,
                                fontSize: 16,)),
                              Obx(()=> AppTextWidget(title: controller.dayOfWeek.value,color: primaryColor,
                                fontSize: 18, fontWeight: FontWeight.w600,)),
                            ],
                          ),
                        ),


                        IconTextCardWidget(
                            title: 'Community', subtitle: 'feedback',
                            icon: Icons.feedback_outlined,
                          onTap: () {
                              Get.toNamed(communityScreen);
                          },),

                        SizedBox(height: heightX*.015),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CardButtonWidget(label: 'Exit Slip', icon: Icons.exit_to_app_outlined,
                              onTap: () { Get.toNamed(slipScreen); },),
                            CardButtonWidget(label: 'Mess Menu', icon: Icons.food_bank_outlined,
                              onTap: () { Get.toNamed(messScreen); },),
                          ],
                        ),

                        SizedBox(height: heightX*.01),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CardButtonWidget(label: 'Complain', icon: Icons.comment_outlined,
                              onTap: () { Get.toNamed(complainScreen); },),
                            CardButtonWidget(label: 'History', icon: Icons.history_outlined,
                              onTap: () { Get.toNamed(historyScreen); },),
                          ],
                        ),

                        IconTextCardWidget(
                            title: 'Track', subtitle: 'complain status',
                            icon: Icons.track_changes_outlined,
                          onTap: () {
                              Get.offNamed(trackScreen);
                          },),

                        const SizedBox(height: 60,),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

