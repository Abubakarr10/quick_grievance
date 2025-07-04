import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/model/complaint_model.dart';
import 'package:quick_grievance/screens/admin/mess/AddMessController.dart';
import 'package:quick_grievance/screens/admin/mess/admin_mess_screen.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';
import 'package:quick_grievance/screens/mess/vote/VoteController.dart';

import '../../../conts/validator/validator.dart';
import '../../../model/mess_model.dart';
import '../../app_widgets/widgets.dart';
import '../../complain/widgets/circle_button_widget.dart';

class ComplaintDetailScreen extends GetView<VoteController> {
  const ComplaintDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VoteController());
    final ComplaintModel arguments = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Get.offNamed(adminScreen);
            },
            child: const Icon(Icons.arrow_back_ios_new,color: pureWhite,)),
        title: AppTextWidget(title: 'Complaint Details',color: pureWhite,
          fontWeight: FontWeight.bold, fontSize: heightX*.02,
        ),
        backgroundColor: secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              AppTextWidget(title: arguments.description,
                fontSize: heightX*.024, fontWeight: FontWeight.bold,
              ),
              AppTextWidget(title: arguments.submitDate,
                fontSize: heightX*.018,
              ),

              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person, color: secondaryColor,),
                      title: const AppTextWidget(title: 'Submitted by:'),
                      trailing: AppTextWidget(title: arguments.fullName, fontWeight: FontWeight.bold,),
                    ),
                    ListTile(
                      leading: const Icon(Icons.bed, color: secondaryColor,),
                      title: const AppTextWidget(title: 'Room.No:'),
                      trailing: AppTextWidget(title: arguments.roomNo, fontWeight: FontWeight.bold,),
                    ),
                    ListTile(
                      leading: const Icon(CupertinoIcons.number_circle_fill, color: secondaryColor,),
                      title: const AppTextWidget(title: 'Reg.No:'),
                      trailing: AppTextWidget(title: arguments.regNo, fontWeight: FontWeight.bold,),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone, color: secondaryColor,),
                      title: const AppTextWidget(title: 'Phone.No:'),
                      trailing: AppTextWidget(title: arguments.phoneNo, fontWeight: FontWeight.bold,),
                    ),
                  ],
                ),
              ),

              SizedBox(height: heightX*.01,),

              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.report_problem, color: Colors.red,),
                      title: const AppTextWidget(title: 'Priority:'),
                      trailing: AppTextWidget(title: arguments.priority, fontWeight: FontWeight.bold,),
                    ),
                    ListTile(
                      leading: const Icon(Icons.type_specimen, color: secondaryColor,),
                      title: const AppTextWidget(title: 'Complaint Type:'),
                      trailing: AppTextWidget(title: arguments.complaintType, fontWeight: FontWeight.bold,),
                    ),

                  ],
                ),
              ),

              SizedBox(height: heightX*.01,),


              Card(
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.report_problem, color: Colors.red,),
                      title: AppTextWidget(title: 'AI Analysis:'),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: AppTextWidget(title: arguments.assistantMessage, fontWeight: FontWeight.w500,),
                    ),
                  ],
                ),
              ),



              SizedBox(height: heightX*.01,),

            ],
          ),
        ),
      ),
    );
  }
}
