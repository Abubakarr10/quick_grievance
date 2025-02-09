import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/images/app_images.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../app_widgets/widgets.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      textColor: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),

          const Column(
            children: [
               HistoryCardWidget(
                 complainTitle: "Fix Room's Fan",
                 status: 'Completed', icon: CupertinoIcons.check_mark_circled, iconColor: Colors.green,),

              HistoryCardWidget(
                 complainTitle: "Problem with Warden",
                 status: 'Rejected', icon: CupertinoIcons.clear_circled, iconColor: Colors.red,),

              HistoryCardWidget(
                 complainTitle: "Water Cooler",
                 status: 'In Process', icon: CupertinoIcons.timelapse, iconColor: Colors.white,),
            ],
          ),

        ],
      ),
    );
  }
}

class HistoryCardWidget extends StatelessWidget {
  final String complainTitle;
  final String date;
  final String status;
  final IconData icon;
  final Color iconColor;
  const HistoryCardWidget({
    super.key, required this.complainTitle, this.date = '', required this.status, required this.icon, required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightX*.2,
      width: widthX,
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: heightX*.015),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(100),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor,
            blurRadius: 10,
            offset: Offset(0, heightX*.02),
          ),
        ]
      ),
      child: Stack(
        children: [

          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding:  EdgeInsets.only(right: heightX*.01),
              child: Icon(icon,color: iconColor.withValues(alpha: 50),
              size: heightX*.1,
              ),
            ),
          ),

          Container(
            height: heightX*.1,
            width: widthX*.7,
            padding: EdgeInsets.symmetric(horizontal: heightX*.01),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(100)
              ),
              boxShadow: [BoxShadow(
                color: Colors.black,
                blurRadius: 10, offset: Offset(0, heightX*.01)
              )]
            ),
            child: Column(
              spacing: heightX*.005,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Text => Complain Title
                AppTextWidget(title: complainTitle,
                textColor: Colors.white, fontSize: heightX*.026,
                  fontWeight: FontWeight.bold,
                ),

                // Text => Date
                Row(
                  spacing: heightX*.01,
                  children: [
                    Icon(Icons.date_range,color: Colors.white,size: heightX*.016,),
                    AppTextWidget(title: "01-Feb-2025 To 05-Feb-2025",
                    textColor: Colors.white, fontSize: heightX*.014,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                // Text => Status
                Row(
                  spacing: heightX*.01,
                  children: [
                    AppTextWidget(title: "Status:",
                    textColor: Colors.white, fontSize: heightX*.016,
                      fontWeight: FontWeight.bold,
                    ),
                    AppTextWidget(title: status,
                    textColor: Colors.white, fontSize: heightX*.016,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
