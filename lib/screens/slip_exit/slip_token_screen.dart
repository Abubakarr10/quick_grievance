import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/model/slip_exit_model.dart';
import 'package:quick_grievance/screens/slip_exit/widgets/widgets.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../../conts/images/app_images.dart';
import '../app_widgets/widgets.dart';

class SlipTokenScreen extends StatelessWidget {
  const SlipTokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SlipExitModel data = Get.arguments['slipData'];
    final String isHistory = Get.arguments['isHistory'];
   // final dynamic id = Get.arguments['slipId'];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: (){
              if(isHistory != ''){
                Get.offNamed(historyDetailScreen,arguments: isHistory);
              }else{
                Get.offNamed(slipScreen);
              }
            },
            backgroundColor: accentColor,
            mini: true,
            child:  const Icon(Icons.close,color: secondaryColor,),
          ),
        ],
      ),
      backgroundColor: secondaryColor,
      body: Stack(
        children: [
          Center(
            child: Container(
              height: heightX*.76,
              width: widthX*.8,
              decoration: const BoxDecoration(
                color: pureWhite,
                boxShadow: [BoxShadow(
                  color: pureBlack,
                  blurRadius: 10,
                  offset: Offset(0, 40)
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: heightX*.04,),
                    Text(data.token,
                      style: GoogleFonts.courierPrime(
                          fontSize: heightX*.05,
                          fontWeight: FontWeight.bold,
                          color: pureBlack,
                      ),
                    ),

                    DuelTextWidget(title: 'Student Name:', value: data.fullName,),
                    DuelTextWidget(title: 'Reg.no:', value: data.regNo,),
                    DuelTextWidget(title: 'Dept.:', value: data.departmentName,),
                    DuelTextWidget(title: 'Batch:', value: data.batch,),
                    DuelTextWidget(title: 'Room.No:', value: data.roomNo,),

                    // AppTextWidget(title: '12:32',
                    // color: accentColor, fontWeight: FontWeight.bold,
                    //   fontSize: heightX*.030,
                    // ),

                    AppTextWidget(title: data.fromDate, fontSize: heightX*.018,
                    fontWeight: FontWeight.bold, color: secondaryColor,
                    ),
                    const Icon(Icons.keyboard_double_arrow_down),
                    AppTextWidget(title: data.toDate,fontSize: heightX*.018,
                        fontWeight: FontWeight.bold,color: secondaryColor,),

                    SizedBox(height: heightX*.01,),

                    DuelTextWidget(title: 'Reason:', value: data.reason,),
                    DuelTextWidget(title: 'Destination:',
                      value: data.address == 'none'? data.destination : data.address,),


                    Visibility(
                      visible: data.guardianName == 'none'? false : true,
                      child: Column(
                        children: [
                          AppTextWidget(title: 'Guardian Information',
                          fontWeight: FontWeight.bold, color: primaryColor, fontSize: heightX*.018,
                          ),
                          SizedBox(height: heightX*.01,),
                          DuelTextWidget(title: 'Relation:', value: data.relation,),
                          DuelTextWidget(title: 'Name:', value: data.guardianName,),
                          DuelTextWidget(title: 'Phone.No:', value: data.guardianPhoneNo,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: heightX*.07),
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: heightX*.05,
                  backgroundColor: pureWhite,
                  child: data.token == 'Rejected'?
                  Icon(CupertinoIcons.xmark_circle_fill,size: heightX*.1,
                    color: Colors.red,
                  )
                      :
                  Icon(Icons.check_circle,size: heightX*.1,
                  color: Colors.green,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              radius: heightX*.035,
                backgroundColor: secondaryColor,
                ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: heightX*.035,
                backgroundColor: secondaryColor,
                ),
          ),
        ],
      ),
    );
  }
}

