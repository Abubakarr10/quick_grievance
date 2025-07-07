import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../../conts/images/app_images.dart';
import '../../model/complaint_model.dart';
import '../../model/slip_exit_model.dart';
import '../../repository/share_preferences/sp_controller.dart';
import '../app_widgets/widgets.dart';

class HistoryDetailScreen extends StatelessWidget {
  const HistoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.offNamed(historyScreen);
        },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
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
                      title: arguments,
                      fontSize: heightX*.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),

          Visibility(
            visible: arguments == 'Last Complaints'? true : false,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('complaint')
                  .where('uid', isEqualTo: currentUserId)
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


                      return InkWell(
                        onTap: (){
                          Get.offNamed(
                            complaintDetailScreen,
                            arguments: {
                              'data': complaintData,
                              'docId': doc.id,
                              'isUser': true,
                              'isHistory': arguments
                            },
                          );
                        },
                        child: HistoryCardWidget(
                          date: complaintData.submitDate,
                          complainTitle: complaintData.description,
                          priority: complaintData.priority,
                          complainType: complaintData.complaintType,
                          status: complaintData.status,
                          icon: complaintData.status == 'Pending'
                              ? CupertinoIcons.minus_circle
                              : complaintData.status == 'In-Process'
                              ? CupertinoIcons.time
                              : complaintData.status == 'Resolved'
                              ? CupertinoIcons.check_mark_circled_solid
                              : complaintData.status == 'Rejected'
                              ? CupertinoIcons.xmark_circle_fill
                              : CupertinoIcons.question,
                          iconColor: complaintData.status == 'Pending'
                              ? primaryColor
                              : complaintData.status == 'In-Process'
                              ? accentColor
                              : complaintData.status == 'Resolved'
                              ? Colors.green
                              : complaintData.status == 'Rejected'
                              ? Colors.red
                              : secondaryColor,),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          Visibility(
            visible: arguments == 'Last Complaints'? false : true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(arguments == 'Accepted Slips'? 'approve_slip_exit' : 'reject_slip_exit')
                      .where('uid', isEqualTo: currentUserId)
                      .snapshots(),
                  builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){

                    if(snapshot.connectionState == ConnectionState.waiting){
                      return  const Align(
                          alignment: Alignment.center,
                          child: SpinKitWidget());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                      return Column(
                        children: [
                          Icon(Icons.close,size: heightX*.1,
                            color: Colors.red,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child:AppTextWidget(title: 'None Accepted Slip', fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ],
                      );
                    }

                    final slipListData = snapshot.data!.docs;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: slipListData.length,
                        itemBuilder: (context,index){
                          final doc = snapshot.data!.docs[index];
                          final slipId = doc.id;
                          final slipData = SlipExitModel.fromJson(doc.data() as Map<String, dynamic>);

                          return Card(
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            color: pureWhite,
                            shadowColor: secondaryColor,
                            child: ListTile(
                              onTap: (){
                                Get.offNamed(slipTokenScreen,arguments: {
                                  'slipData': slipData,
                                  'slipId': slipId,
                                  'isHistory' : arguments
                                });
                              },
                              leading: const Icon(Icons.card_membership,color: secondaryColor,size: 30,),
                              title: AppTextWidget(title: slipData.reason,fontSize: heightX*.020,fontWeight: FontWeight.bold,),
                              subtitle: AppTextWidget(title: slipData.destination),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppTextWidget(title: slipData.fromDate),
                                  AppTextWidget(title: slipData.toDate),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            ),
          )

        ],
      ),
    );
  }
}
