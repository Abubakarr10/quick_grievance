import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/images/app_images.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../app_widgets/widgets.dart';

class SlipExitScreen extends StatelessWidget {
  const SlipExitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          /// Text => Slip Exit
          Stack(
            children: [

              Image.asset(appBarVector),

              // Screen Title => Slip Exit
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                  child: AppTextWidget(
                      title: 'Slip Exit',
                      fontSize: heightX*.03,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),

          

        ],
      ),
    );
  }
}