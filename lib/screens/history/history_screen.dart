import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/entryPoint/entry_point_screen.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../app_widgets/widgets.dart';
import 'widgets/custom_card_widget.dart';

class HistoryScreen extends StatelessWidget {
  final bool backoff;
  const HistoryScreen({super.key, this.backoff = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Visibility(
        visible: backoff == true ? false : true,
        child: FloatingActionButton(
          onPressed: (){
            Get.offNamed(entryPointScreen);
          },
          backgroundColor: accentColor,
          mini: true,
          child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
        ),
      ),
      body: Column(
        children: [

          /// Text => History
          Stack(
            children: [

              Image.asset(appBarVector),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                  child: AppTextWidget(
                      title: 'History',
                      fontSize: heightX*.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              spacing: heightX*.02,
              children: [

                CustomCardWidget(
                  title: 'Accepted Slips',
                  subtitle: 'View all your accepted exit slips.',
                  leading: Icon(CupertinoIcons.check_mark_circled_solid,
                    size: heightX*.032,
                    color: Colors.green,),
                  onTap: () {
                    Get.offNamed(historyDetailScreen,arguments: 'Accepted Slips');
                  },),

                CustomCardWidget(
                  title: 'Rejected Slips',
                  subtitle: 'View all your rejected exit slips.',
                  leading: Icon(CupertinoIcons.xmark_circle_fill,
                    size: heightX*.032,
                    color: Colors.red,),
                  onTap: () {
                    Get.offNamed(historyDetailScreen,arguments: 'Rejected Slips');
                  },),

                CustomCardWidget(
                  title: 'Complaints',
                  subtitle: 'View all your past complaints.',
                  leading: Icon(Icons.report,
                    size: heightX*.032,
                    color: accentColor,),
                  onTap: () {
                    Get.offNamed(historyDetailScreen,arguments: 'Last Complaints');
                  },),
              ],
            ),
          )

        ],
      ),
    );
  }
}


