import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/admin/mess/AddMessController.dart';
import 'package:quick_grievance/screens/admin/mess/admin_mess_screen.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';
import 'package:quick_grievance/screens/mess/vote/VoteController.dart';

import '../../../conts/validator/validator.dart';
import '../../../model/mess_model.dart';
import '../../app_widgets/widgets.dart';
import '../../complain/widgets/circle_button_widget.dart';

class MessDetailScreen extends GetView<VoteController> {
  const MessDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VoteController());
    final arguments = Get.arguments as Map<String, dynamic>;
    final String voteBank = arguments['voteBank'] ?? 'none';
    final String title = arguments['title'] ?? 'none';
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Get.offNamed(adminScreen,arguments: 3);
            },
            child: const Icon(Icons.arrow_back_ios_new,color: pureWhite,)),
        title: AppTextWidget(title: 'Detail Of Votes $voteBank',color: pureWhite,
          fontWeight: FontWeight.bold, fontSize: heightX*.02,
        ),
        backgroundColor: secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              AppTextWidget(title: title,
              fontSize: heightX*.024,
              ),

              SizedBox(height: heightX*.01,),

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
                            child:AppTextWidget(title: 'None Votes', fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ],
                      );
                    }

                   //   final messListData = snapshot.data!.docs;
                    final doc = snapshot.data!.docs[0];
                    final messData = MessModel.fromJson(doc.data() as Map<String, dynamic>);

                    return ListView.builder(
                      itemCount: voteBank == 'B'? messData.voteB.length : messData.voteA.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return FutureBuilder<DocumentSnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('users')
                              .doc(voteBank == 'B'? messData.voteB.elementAt(index) : messData.voteA.elementAt(index),)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Text('');
                            }

                            if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) {
                              return const ListTile(
                                title: Text('User not found'),
                              );
                            }

                            final data = snapshot.data!.data() as Map<String, dynamic>;
                            final fullName = data['full_name'] ?? 'No Name';
                            final roomNo = data['room_no'] ?? 'No room';

                            return Card(
                              color: pureWhite,
                              elevation: 10,
                              shadowColor: secondaryColor,
                              child: ListTile(
                                leading: AppTextWidget(
                                  title: '${index + 1}',
                                  fontSize: heightX * .03,
                                  fontWeight: FontWeight.bold,
                                  color: accentColor,
                                ),
                                title: AppTextWidget(
                                  title: fullName,
                                  fontWeight: FontWeight.w700,
                                  fontSize: heightX * .024,
                                ),
                                trailing: AppTextWidget(
                                  title: 'Room: $roomNo',
                                  fontWeight: FontWeight.w500,
                                  fontSize: heightX * .016,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                    ;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
