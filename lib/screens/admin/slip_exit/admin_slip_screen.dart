import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/model/slip_exit_model.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import 'AdminSlipController.dart';

class AdminSlipScreen extends GetView<AdminSlipController> {
  const AdminSlipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminSlipController());

    return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('request_slip_exit')
                .orderBy('fromDate', descending: false)
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_forever_outlined,size: heightX*.1,
                    color: Colors.red,
                    ),
                     const Align(
                      alignment: Alignment.center,
                      child:AppTextWidget(title: 'None Slip Requests', fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ],
                );
              }

              final postListData = snapshot.data!.docs;
              return Expanded(
                flex: 10,
                child: ListView.builder(
                    itemCount: postListData.length,
                    itemBuilder: (context,index){
                      final doc = snapshot.data!.docs[index];
                      final slipId = doc.id;
                      final slipData = SlipExitModel.fromJson(doc.data() as Map<String, dynamic>);

                      return Card(
                        elevation: 15,
                        color: pureWhite,
                        shadowColor: secondaryColor,
                        margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.note_alt, color: primaryColor),
                                  const SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppTextWidget(title: slipData.reason, fontSize: heightX*.02,fontWeight: FontWeight.w600,),
                                      SizedBox(
                                        width: widthX*.5,
                                        child: AppTextWidget(
                                          title: "Destination: ${slipData.destination == "none"? slipData.address : slipData.destination}",
                                          fontWeight: FontWeight.w400,
                                          fontSize: heightX*.014,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AppTextWidget(title: slipData.fullName, fontSize: heightX*.018,fontWeight: FontWeight.w600,),
                                      AppTextWidget(title: "Room.no: ${slipData.roomNo}", fontWeight: FontWeight.w400,
                                        fontSize: heightX*.014,
                                      ),
                                      AppTextWidget(title: "Batch: ${slipData.batch}", fontWeight: FontWeight.w400,
                                        fontSize: heightX*.014,
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: heightX*.005,),

                              AppTextWidget(title: 'From Date -> To Date', fontWeight: FontWeight.bold,
                                fontSize: heightX*.014, color: primaryColor,
                              ),

                              Container(
                                height: heightX*.04,
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                margin: EdgeInsets.symmetric(vertical: heightX*.008),
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppTextWidget(title: slipData.fromDate, fontWeight: FontWeight.w500,
                                      fontSize: heightX*.014, color: accentColor,
                                    ),
                                    const Icon(Icons.arrow_circle_right,color: accentColor,),
                                    AppTextWidget(title: slipData.toDate, fontWeight: FontWeight.w500,
                                      fontSize: heightX*.014, color: accentColor,
                                    ),
                                  ],
                                ),
                              ),

                              Visibility(
                                visible: slipData.address == 'none'? true : false,
                                child: Row(
                                  children: [
                                    const Icon(Icons.person),
                                    const SizedBox(width: 5,),
                                    AppTextWidget(title: 'By Self: Yes!', fontWeight: FontWeight.bold,
                                      fontSize: heightX*.016,
                                    ),
                                  ],
                                ),
                              ),

                              Visibility(
                                visible: slipData.destination == 'none'? true : false,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.person),
                                        const SizedBox(width: 5,),
                                        AppTextWidget(title: 'Receiving By:',
                                        fontSize: heightX*.016, fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppTextWidget(title: 'Guardian Name:', fontWeight: FontWeight.w500,
                                          fontSize: heightX*.014,
                                        ),
                                        AppTextWidget(title: slipData.guardianName, fontWeight: FontWeight.w600,
                                          fontSize: heightX*.014,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppTextWidget(title: 'Guardian Phone.No:', fontWeight: FontWeight.w500,
                                          fontSize: heightX*.014,
                                        ),
                                        AppTextWidget(title: slipData.guardianPhoneNo, fontWeight: FontWeight.w600,
                                          fontSize: heightX*.014,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              const Divider(),

                              Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(icon: const Icon(Icons.check, color: Colors.blue),
                                    onPressed: () {
                                  controller.acceptRequestAndDelete(slipId,slipData,false);
                                    }),
                                IconButton(icon: const Icon(Icons.close, color: Colors.red), onPressed: () {
                                  controller.acceptRequestAndDelete(slipId,slipData,true);
                                }),
                              ],
                            ),

                            ],
                          ),
                        ),

                      );
                    }),
              );
            });
  }
}
