import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_grievance/repository/share_preferences/sp_controller.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/app_height_width.dart';
import '../../../conts/functions/time_ago_function.dart';
import '../../../conts/images/app_images.dart';
import '../../../model/comment_model.dart';
import '../../../model/post_model.dart';
import '../../app_widgets/widgets.dart';
import '../CommunityController.dart';
import 'more_button_icon_widget.dart';

class PostCardWidget extends StatelessWidget {
  final PostModel postData;
  final String postId;
  const PostCardWidget({
    super.key,
    required this.controller, required this.postData, required this.postId,
  });

  final CommunityController controller;

  @override
  Widget build(BuildContext context) {
    final timeAgoText = getTimeAgo(postData.postDate);

    final bool isLiked = postData.likes.contains(currentUserId);
    final int totalLikes = postData.likes.length;

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

                // Avatar Picture
                 const CircleAvatar(
                  backgroundColor: primaryColor,
                  backgroundImage: AssetImage(hosteliteIcon,
                  ),
                ),

                const SizedBox(width: 10,),

                // User Profile Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text>> User Name
                    AppTextWidget(title: postData.fullName,
                      fontSize: heightX*.016, fontWeight: FontWeight.bold,
                    ),
                    // Text>> Department Name
                    AppTextWidget(title: postData.departmentName,
                      fontSize: heightX*.012, fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                const Spacer(),

                // Text>> Posted Date
                AppTextWidget(title: timeAgoText,
                  color: midTextColor, fontSize: heightX*.012,
                ),

              ],
            ),

            const SizedBox(height: 5,),

            // Text>> Captions
            Align(
                alignment: Alignment.topLeft,
                child: AppTextWidget(title: postData.captions)),

            const SizedBox(height: 10,),

            // Post Image
            Visibility(
              visible: postData.postImage == ''? false : true,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImageWidget(
                    networkImage: postData.postImage,
                     width: widthX*.99,
                     height: heightX*.27,
                  )
              ),
            ),

            const SizedBox(height: 10,),

            Row(
              children: [

                InkWell(
                  onTap: () => controller.toggleLike(postId, currentUserId),
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                ),


                const SizedBox(width: 5,),
                // Total Likes

                AppTextWidget(title: totalLikes.toString()),

                const SizedBox(width: 15,),

                Obx(()=>
                    InkWell(
                      onTap: (){
                        controller.toggleCommentVisibility(postId);
                      },
                      child: Icon(
                        controller.commentVisibilityMap[postId]?.value ?? false ? Icons.comment : Icons.comment_outlined,
                        color: secondaryColor,),
                    ),
                ),

                const SizedBox(width: 5,),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('post')
                      .doc(postId)
                      .collection('comments')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('0');
                    }
                    final count = snapshot.data?.docs.length ?? 0;
                    return AppTextWidget(title: '$count');
                  },
                ),

                const Spacer(),

                Visibility(
                    visible: currentUserId == postData.uid ? true : false,
                    child: MoreButtonIconWidget(
                      postId: postId,
                      currentText: postData.captions,
                    ))

              ],
            ),

            const SizedBox(height: 5,),

            Obx(() =>
                Visibility(
              visible: controller.commentVisibilityMap[postId]?.value ?? false,
              child: Column(
                children: [
                  // Comment Input
                  Row(
                    children: [
                      Expanded(
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
                            labelText: 'Write a comment...',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: heightX*.014,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                            alignLabelWithHint: false,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const CircleAvatar(
                            backgroundColor: accentColor,
                            child: Center(child: Icon(Icons.send, color: secondaryColor))),
                        onPressed: () => controller.submitComment(postId),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Real-time Comment List
                  StreamBuilder<List<CommentModel>>(
                    stream: controller.getCommentsStream(postId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('No comments yet');
                      }

                      final comments = snapshot.data!;

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          final comment = comments[index];

                          final timestamp = getTimeAgo(comment.timestamp);
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            trailing: MoreButtonIconWidget(
                                postId: postId,
                                isCommentDoc: true,
                                commentId: comment.commentId,
                                currentText: comment.comment
                            ),
                            leading: const CircleAvatar(
                                backgroundColor: secondaryColor,
                                child: Icon(Icons.person,color: primaryColor,)),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppTextWidget(title: comment.fullName, fontWeight: FontWeight.w700,),
                                const SizedBox(width: 10,),
                                AppTextWidget(title: timestamp,
                                  fontWeight: FontWeight.w400, color: midTextColor,
                                  fontSize: 10,
                                ),
                              ],
                            ),
                            subtitle: AppTextWidget(title: comment.comment, fontSize: 12,),
                          );
                        },
                      );
                    },
                  ),

                ],
              ),
            )),


          ],
        ),
      ),
    );
  }
}

