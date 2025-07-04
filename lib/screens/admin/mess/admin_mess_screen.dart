import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/app_widgets/action_button_widget.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';
import '../../../model/mess_model.dart';
import '../../app_widgets/widgets.dart';
import '../../mess/widgets/widgets.dart';
import '../admin_dashboard/AdminController.dart';

class AdminMessScreen extends GetView<AdminController> {
  const AdminMessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminController());

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: heightX*.01,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextWidget(title: 'Today\'s Menu', fontSize: heightX*.026, fontWeight: FontWeight.bold,),
                const Tooltip(message: 'Tap on Options to see Details',
                child: Icon(Icons.info,color: midTextColor,),
                ),
              ],
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
                        final messData = MessModel.fromJson(doc.data() as Map<String, dynamic>);

                        return Column(
                            children: [
                            MessCardWidget(
                              onTap: (){
                                // A
                                Get.offNamed(messDetailScreen,arguments: {
                                  'voteBank': 'A',
                                  'title': messData.optionA
                                });
                              },
                              mealTitle: messData.optionA,
                            description: messData.descriptionA == 'none'? '' : messData.descriptionA,
                            price: messData.optionPriceA,
                            image: messData.optionImageA,
                        vote: messData.voteA.length.toString() ,),

                        SizedBox(height: heightX*.03,),

                        MessCardWidget(
                          onTap: (){
                            // B
                            Get.offNamed(messDetailScreen,arguments: {
                              'voteBank': 'B',
                              'title': messData.optionB
                            });
                          },
                          mealTitle: messData.optionB,
                        description: messData.descriptionB == 'none'? '' : messData.descriptionB,
                        price: messData.optionPriceB,
                        image: messData.optionImageB,
                        vote: messData.voteB.length.toString(),),
                        ],
                        );
                      });
                }),



            SizedBox(height: heightX*.02,),
            Align(
              alignment: Alignment.center,
              child: ActionButtonWidget(label: 'Add New Mess', onTap: (){
                Get.offNamed(addMessScreen);
              }),
            )

          ],
        ),
      ),
    );
  }
}

class MenuDisplayWidget extends StatelessWidget {
  final String menuTitle;
  final String option;
  final String image;
  const MenuDisplayWidget({
    super.key, required this.menuTitle, required this.option, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(title: 'Option $option:',
        fontSize: heightX*.020, color: primaryColor, fontWeight: FontWeight.bold,
        ),
        SizedBox(height: heightX*.01),
        Card(
          color: pureWhite,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.restaurant_menu, size: 32, color: primaryColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppTextWidget(title: menuTitle, fontSize: heightX*.020,),
                    ),
                  ],
                ),
                SizedBox(height: heightX*.01,),
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImageWidget(
                        networkImage: 'https://www.indianhealthyrecipes.com/wp-content/uploads/2021/12/chicken-biryani-recipe.webp',
                        width: widthX*.8,
                        height: heightX*.2,
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
