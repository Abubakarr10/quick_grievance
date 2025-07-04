import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/model/complaint_model.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import '../../../conts/app_height_width.dart';
import '../admin_dashboard/AdminController.dart';


class AdminComplaintScreen extends StatelessWidget {
  const AdminComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminController>();

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('complaint')
            .snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
            return  Padding(
              padding: EdgeInsets.only(top: heightX*.4),
              child: const Align(
                  alignment: Alignment.center,
                  child: SpinKitWidget()),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child:AppTextWidget(title: 'None Complaint', fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            );
          }

          final complaintListData = snapshot.data!.docs;

          return ListView.builder(
            itemCount: complaintListData.length,
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              final complaintData = ComplaintModel.fromJson(doc.data() as Map<String, dynamic>);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 10,
                  shadowColor: secondaryColor,
                  color: pureWhite,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    onTap: (){
                      Get.offNamed(complaintDetailScreen,arguments: complaintData);
                    },
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.report_problem, color: Colors.red),
                        AppTextWidget(title: complaintData.priority,fontWeight: FontWeight.bold,),
                      ],
                    ),
                    title: AppTextWidget(title: complaintData.description, fontSize: heightX*.018,fontWeight: FontWeight.w600,),
                    subtitle:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextWidget(title: "Category: ${complaintData.complaintType}",fontWeight: FontWeight.w400,
                          fontSize: heightX*.014,),
                        AppTextWidget(title: "Submitted on: ${complaintData.submitDate}",fontWeight: FontWeight.w400,
                          fontSize: heightX*.014,),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            },
          )
          ;
        });
  }
}

