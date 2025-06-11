import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/app_height_width.dart';
import '../../../conts/images/app_images.dart';
import '../../app_widgets/widgets.dart';
import '../CommunityController.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.controller,
  });

  final CommunityController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: pureWhite,
      elevation: 15,
      shadowColor: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [

                // Profile Picture
                const CircleAvatar(
                  backgroundColor: secondaryColor,
                ),

                const SizedBox(width: 10,),

                // User Profile Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextWidget(title: 'Noor Fatima',
                      fontSize: heightX*.016, fontWeight: FontWeight.bold,
                    ),
                    AppTextWidget(title: 'Dept. Computer Science',
                      fontSize: heightX*.012, fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                const Spacer(),

                AppTextWidget(title: '10 mins ago',
                  textColor: midTextColor, fontSize: heightX*.012,
                ),

              ],
            ),

            const SizedBox(height: 5,),

            const Align(
                alignment: Alignment.topLeft,
                child: AppTextWidget(title: 'I Like Mess Food and good taste')),

            const SizedBox(height: 10,),

            // Post Image
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(mixVegetable, fit: BoxFit.cover,)),

            const SizedBox(height: 10,),

            Row(
              children: [

                Obx(()=>
                    InkWell(
                      onTap: (){
                        controller.isLike.value = !controller.isLike.value;
                      },
                      child: Icon(
                        controller.isLike.value? Icons.favorite : Icons.favorite_border,
                        color: controller.isLike.value? Colors.red : midTextColor,
                      ),
                    )
                ),

                const SizedBox(width: 5,),
                const AppTextWidget(title: '10'),

                const SizedBox(width: 15,),

                Obx(()=>
                    InkWell(
                      onTap: (){
                        controller.isCommentOpen.value = !controller.isCommentOpen.value;
                      },
                      child: Icon(
                        controller.isCommentOpen.value? Icons.comment : Icons.comment_outlined,
                        color: secondaryColor,),
                    ),
                ),
                const SizedBox(width: 5,),
                const AppTextWidget(title: '2'),
              ],
            ),

            const SizedBox(height: 5,),

            Obx(()=>
                Visibility(
                  visible: controller.isCommentOpen.value == true,
                  child: TextFormField(
                    maxLines: 1,
                    controller: controller.commentController,
                    keyboardType: TextInputType.multiline, // Enables multi-line input from keyboard
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: secondaryColor,
                              width: 2
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: secondaryColor,
                              width: 2
                          )
                      ),
                      labelText: 'Any Comment',
                      labelStyle: GoogleFonts.poppins(
                        fontSize: heightX*.014,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                      alignLabelWithHint: false,
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
