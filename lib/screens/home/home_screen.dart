import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import 'package:quick_grievance/screens/home/widgets/widgets.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(
          spacing: heightX*.012,
          children: [

            Stack(
              children: [
                Image.asset(topBarVector),

                Padding(
                  padding: EdgeInsets.only(left: 20,top: heightX*.03),
                  child: Row(
                    children: [
                      AppTextWidget(title: 'Salam! Abubakar',
                        fontSize: heightX*.018, fontWeight: FontWeight.bold,
                      ),
                      AppTextWidget(title: ' 👋🏼',
                        fontSize: heightX*.024, fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(top: heightX*.04 ,right: heightX*.02),
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppTextWidget(title: '14, January 2025', textColor: Colors.white,
                          fontSize: 18,),
                        AppTextWidget(title: 'Tuesday',textColor: Colors.white,
                          fontSize: 22, fontWeight: FontWeight.w600,),
                      ],
                    ),
                  ),
                )
              ],
            ),


            const IconTextCardWidget(
                title: 'Community', subtitle: 'feedback',
                icon: Icons.feedback_outlined),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardButtonWidget(label: 'Slip Exit', icon: Icons.exit_to_app_outlined,
                  onTap: () { Get.toNamed(slipExitScreen); },),
                CardButtonWidget(label: 'Mess Menu', icon: Icons.food_bank_outlined,
                  onTap: () { Get.toNamed(messScreen); },),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardButtonWidget(label: 'Complain', icon: Icons.comment_outlined,
                  onTap: () {  },),
                CardButtonWidget(label: 'History', icon: Icons.history_outlined,
                  onTap: () { Get.toNamed(historyScreen); },),
              ],
            ),

            const IconTextCardWidget(
                title: 'Track', subtitle: 'complain status',
                icon: Icons.track_changes_outlined),

            const SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}

