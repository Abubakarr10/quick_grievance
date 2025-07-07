import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/model/complaint_model.dart';
import 'package:quick_grievance/screens/admin/complaint/AdminComplainController.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import 'package:quick_grievance/screens/slip_exit/widgets/duel_text_widget.dart';
import '../../../conts/app_height_width.dart';


class AdminComplaintScreen extends GetView<AdminComplainController> {
  const AdminComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminComplainController());

    return Column(
      children: [

        Obx(() => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 8,
            children: [
              for (var status in ['All', 'Pending', 'In-Process', 'Resolved', 'Rejected'])
                FilterChip(
                  label: Text(status),
                  selected: controller.selectedFilter.value == status,
                  onSelected: (_) => controller.selectedFilter.value = status,
                )
            ],
          ),
        )),


        Obx(() =>
            StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('complaint')
              .where(
            controller.selectedFilter.value == 'All' ? FieldPath.documentId : 'status',
            isEqualTo: controller.selectedFilter.value == 'All' ? null : controller.selectedFilter.value,
          )
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: EdgeInsets.only(top: heightX * .4),
                child: const Align(
                    alignment: Alignment.center, child: SpinKitWidget()),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No Complaints Found'));
            }

            final complaintListData = snapshot.data!.docs;

            return Expanded(
              child: ListView.builder(
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

                          controller.docId.value = doc.id;

                          Get.offNamed(
                            complaintDetailScreen,
                            arguments: {
                              'data': complaintData,
                              'docId': controller.docId.value,
                              'isUser': false,
                              'isHistory': ''
                            },
                          );
                        },
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.report_problem, color: Colors.red),
                            AppTextWidget(title: complaintData.priority,
                              fontWeight: FontWeight.bold,),
                          ],
                        ),
                        title: AppTextWidget(title: complaintData.description, fontSize: heightX*.02,fontWeight: FontWeight.w600,),
                        subtitle:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DuelTextWidget(
                                fontSize: .014,
                                title: 'Status:', value: complaintData.status),
                            DuelTextWidget(
                                fontSize: .014,
                                title: 'Category:', value: complaintData.complaintType),
                            AppTextWidget(title: "Date: ${complaintData.submitDate}",fontWeight: FontWeight.w400,
                              fontSize: heightX*.014,),
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        )),


      ],
    );
  }
}

