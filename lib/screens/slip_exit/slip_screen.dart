import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/screens/home/widgets/widgets.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../../conts/images/app_images.dart';
import '../../conts/routes/screen_names.dart';
import '../../model/slip_exit_model.dart';
import '../../repository/share_preferences/sp_controller.dart';
import '../app_widgets/widgets.dart';

class SlipScreen extends StatelessWidget {
  final bool backoff;
  const SlipScreen({super.key, this.backoff = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Visibility(
        visible: backoff == true ? false : true,
        child: FloatingActionButton(
          onPressed: (){
            Get.offNamed(entryPointScreen);
          },
          backgroundColor: accentColor,
          mini: true,
          child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Text => Slip Exit
            Stack(
              children: [

                Image.asset(appBarVector),

                // Screen Title => Slip Exit
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthX*.04),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                          child: AppTextWidget(
                              title: 'Exit Slips',
                              fontSize: heightX*.03,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: heightX*.13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      IconTextCardWidget(title: 'Submit', subtitle: 'Slip Exit',
                          icon: Icons.exit_to_app,
                          onTap: (){
                        Get.offNamed(slipExitScreen);
                          }),


                      Padding(
                        padding: EdgeInsets.only(left: 20,top: heightX*.01),
                        child: AppTextWidget(title: 'Your Accepted Slips',
                          fontWeight: FontWeight.bold,color: primaryColor,
                          fontSize: heightX*.026,
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('approve_slip_exit')
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
                                    if (kDebugMode) {
                                      print('Post Data>>>> $slipData');
                                    }
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
                                            'backTo': slipScreen
                                          });
                                        },
                                        leading: Icon(Icons.card_membership,color: secondaryColor,size: heightX*.03,),
                                        title: AppTextWidget(title: slipData.reason,fontSize: heightX*.020,fontWeight: FontWeight.bold,),
                                        subtitle: AppTextWidget(title: slipData.destination),
                                        trailing: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            AppTextWidget(title: slipData.fromDate,fontSize: heightX*.012,),
                                            AppTextWidget(title: slipData.toDate,fontSize: heightX*.012),
                                            AppTextWidget(title: 'Token: ${slipData.token}',fontSize: heightX*.014),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }),
                      )

                    ],
                  ),
                ),

              ],
            ),

            const SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}
