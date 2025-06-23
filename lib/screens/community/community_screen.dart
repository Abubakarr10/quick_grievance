import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/screens/community/CommunityController.dart';
import 'package:quick_grievance/screens/community/widgets/widgets.dart';

import '../../../conts/app_height_width.dart';
import '../../../conts/images/app_images.dart';

import '../../conts/app_colors.dart';
import '../../conts/routes/screen_names.dart';
import '../../model/post_model.dart';
import '../app_widgets/widgets.dart';

class CommunityScreen extends GetView<CommunityController> {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CommunityController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: (){
              Get.offNamed(entryPointScreen);
            },
            backgroundColor: accentColor,
            mini: true,
            child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: FloatingActionButton(
              onPressed: (){
                Get.offNamed(addPostScreen);
              },
              backgroundColor: primaryColor,
              mini: true,
              child: const Icon(Icons.post_add,color: secondaryColor,),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [

          Stack(
            children: [


              Column(
                children: [

                 SizedBox(height: heightX*.1,),


                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('post')
                          .orderBy('post_date', descending: true)
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
                                child:AppTextWidget(title: 'None Post', fontSize: 20, fontWeight: FontWeight.w700),
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
                                final postId = doc.id;
                                final postData = PostModel.fromJson(doc.data() as Map<String, dynamic>);
                                if (kDebugMode) {
                                  print('Post Data>>>> ${postData.postImage}');
                                }
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: PostCardWidget(
                                      controller: controller,
                                      postData: postData,
                                    postId: postId,
                                  ),
                                );
                              }),
                        );
                      }),

                ],
              ),

              // Top AppBar bg vector
              Image.asset(appBarVector),

              // Screen Title => Community
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthX*.04),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                        child: AppTextWidget(
                            title: 'Community',
                            fontSize: heightX*.03,
                            textColor: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),


                  ],
                ),
              ),

            ],
          ),


        ],
      ),
    );
  }
}



