import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/mess/vote/VoteController.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../../model/mess_model.dart';
import '../app_widgets/widgets.dart';
import 'widgets/widgets.dart';

class MessScreen extends GetView<VoteController> {
  const MessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VoteController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.offNamed(entryPointScreen);
        },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            /// Text => Mess
            Stack(
              children: [
        
                Image.asset(appBarVector),
        
                // Screen Title => Mess
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: heightX*.06,),
                    child: AppTextWidget(
                        title: 'Mess',
                        fontSize: heightX*.03,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
        
            // Today's Mess
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  AppTextWidget(title: "Today's Mess",
                  fontSize: heightX*.03, fontWeight: FontWeight.w700,
                  ),

        
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('mess')
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
                                child:AppTextWidget(title: 'None Mess', fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ],
                          );
                        }
        
                      //  final messListData = snapshot.data!.docs;
                        return ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index){
                              final doc = snapshot.data!.docs[index];
                              controller.messId.value = doc.id;
                              final messData = MessModel.fromJson(doc.data() as Map<String, dynamic>);
                              controller.messModelData = MessModel.fromJson(doc.data() as Map<String, dynamic>);
                              if (kDebugMode) {
                                print('Post Data>>>> $messData');
                              }
                              return Column(
                                children: [
                                  MessCardWidget(mealTitle: messData.optionA,
                                    description: messData.descriptionA == 'none'? '' : messData.descriptionA,
                                    price: messData.optionPriceA,
                                    image: messData.optionImageA,
                                    vote: messData.voteA.length.toString() ,),
        
                                  SizedBox(height: heightX*.03,),
        
                                  MessCardWidget(mealTitle: messData.optionB,
                                    description: messData.descriptionB == 'none'? '':messData.descriptionB,
                                    price: messData.optionPriceB,
                                    image: messData.optionImageB,
                                    vote: messData.voteB.length.toString(),),
                                ],
                              );
                            });
                      }),
        
        
                ],
              ),
            ),
        
            SizedBox(height: heightX*.02,),
        
            Align(
              alignment: Alignment.center,
              child: ActionButtonWidget(label: 'Vote Meal',
                  onTap: (){
                Get.toNamed(voteScreen);
                  })
            ),
        
            const SizedBox(height: 30,),
        
          ],
        ),
      ),
    );
  }
}
