import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';

class HistoryCardWidget extends StatelessWidget {
  final String complainTitle,complainType,priority;
  final String date;
  final String status;
  final IconData icon;
  final Color iconColor;
  const HistoryCardWidget({
    super.key, required this.complainTitle, this.date = '', required this.status, required this.icon, required this.iconColor,
    this.complainType = '', this.priority = '',
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

          // Status Icon
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding:  EdgeInsets.only(right: heightX*.02),
              child: Icon(icon,color: iconColor.withValues(alpha: 50),
                size: heightX*.08,
              ),
            ),
          ),

          // Inner Top Left Container
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
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
                    child: AppTextWidget(title: complainTitle,
                      color: pureWhite, fontSize: heightX*.026,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Text => Date
                Row(
                  spacing: heightX*.01,
                  children: [
                    Icon(Icons.date_range,color: Colors.white,size: heightX*.016,),
                    AppTextWidget(title: date,
                      color: Colors.white, fontSize: heightX*.014,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                // Text => Status
                Row(
                  spacing: heightX*.01,
                  children: [
                    AppTextWidget(title: "Status:",
                      color: Colors.white, fontSize: heightX*.016,
                      fontWeight: FontWeight.bold,
                    ),
                    AppTextWidget(title: status,
                      color: Colors.white, fontSize: heightX*.016,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),


              ],
            ),
          ),


          Padding(
            padding: EdgeInsets.only(left: 10,top: heightX*.12),
            child: Column(
              spacing: heightX*.01,
              children: [

                Visibility(
                  visible: priority == ''? false : true,
                  child: Row(
                    children: [
                      const Icon(Icons.flag_circle,color: accentColor,),
                      const SizedBox(width: 5,),
                      AppTextWidget(title: priority,color: Colors.white,)
                    ],
                  ),
                ),

                Row(
                  children: [
                    const Icon(CupertinoIcons.rectangle_stack,color: accentColor,),
                    const SizedBox(width: 5,),
                    AppTextWidget(title: complainType,color: Colors.white,)
                  ],
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
}