import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/screens/admin/approve_user/ApproveController.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';
import 'package:quick_grievance/screens/app_widgets/spin_kit_widget.dart%20';
import 'package:quick_grievance/screens/slip_exit/widgets/duel_text_widget.dart';

import '../../../model/user_model.dart';
import '../slip_exit/AdminSlipController.dart';

class ApproveUserScreen extends GetView<ApproveUserController> {
  const ApproveUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApproveUserController());

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where('isAuthorized', isEqualTo: 'false')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: SpinKitWidget());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: AppTextWidget(title: 'No unauthorized users found'));
        }

        final userDocs = snapshot.data!.docs;

        return ListView.builder(
          itemCount: userDocs.length,
          itemBuilder: (context, index) {
            final doc = userDocs[index];
            final userModel = UserModel.fromJson(doc.data() as Map<String, dynamic>);
            final docId = doc.id;


            return Card(
              elevation: 5,
              child: ListTile(
                title: AppTextWidget(title: userModel.fullName,fontWeight: FontWeight.bold,fontSize: heightX*.02,),
                subtitle: Column(
                  children: [
                    DuelTextWidget(title: 'Room.No:', value: userModel.roomNo,fontSize: .014,),
                    DuelTextWidget(title: 'Dept. Name:', value: userModel.departmentName,fontSize: .014,),
                    DuelTextWidget(title: 'Batch:', value: userModel.batch,fontSize: .014,),
                    DuelTextWidget(title: 'Reg.No:', value: userModel.regNo,fontSize: .014,),
                    DuelTextWidget(title: 'Phone.No:', value: userModel.phoneNo,fontSize: .014,),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(CupertinoIcons.check_mark_circled_solid, color: Colors.blue),
                      onPressed: () => controller.approveUser(docId),
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.red),
                      onPressed: () => controller.rejectUser(docId),
                    ),
                  ],
                ),
              ),
            );

          },
        );
      },
    )
    ;
  }
}
