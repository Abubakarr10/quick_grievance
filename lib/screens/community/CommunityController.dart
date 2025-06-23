import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/repository/share_preferences/sp_controller.dart';

import '../../model/comment_model.dart';

class CommunityController extends GetxController {

  RxMap<String, RxBool> likedPosts = <String, RxBool>{}.obs;
  RxMap<String, RxInt> totalLikesMap = <String, RxInt>{}.obs;


  TextEditingController commentController = TextEditingController();
  RxMap<String, RxBool> commentVisibilityMap = <String, RxBool>{}.obs;

  void toggleCommentVisibility(String postId) {
    if (commentVisibilityMap.containsKey(postId)) {
      commentVisibilityMap[postId]!.value = !commentVisibilityMap[postId]!.value;
    } else {
      commentVisibilityMap[postId] = true.obs;
    }
  }

  void initLikeStatus(String postId, List<dynamic> likes, currentUserId) {
    likedPosts[postId] = RxBool(likes.contains(currentUserId));
    totalLikesMap[postId] = RxInt(likes.length);
  }

  // Function: Like and dislike 💓
  Future<void> toggleLike(String postId, String currentUserId) async {
    final postRef = FirebaseFirestore.instance.collection('post').doc(postId);
    final snapshot = await postRef.get();

    final List<dynamic> likes = snapshot['likes'] ?? [];
    final isLiked = likes.contains(currentUserId);

    if (isLiked) {
      await postRef.update({'likes': FieldValue.arrayRemove([currentUserId])});
      likedPosts[postId]?.value = false;
      totalLikesMap[postId]?.value = (totalLikesMap[postId]?.value ?? 1) - 1;
    } else {
      await postRef.update({'likes': FieldValue.arrayUnion([currentUserId])});
      likedPosts[postId]?.value = true;
      totalLikesMap[postId]?.value = (totalLikesMap[postId]?.value ?? 0) + 1;
    }
  }


  // Submit comment 💬
  Future<void> submitComment(String postId) async {
    if (currentUser == null || commentController.text.trim().isEmpty) return;

    final userDoc = await FirebaseFirestore.instance.collection('users').doc(currentUserId).get();
    final fullName = userDoc['full_name'] ?? 'Unknown';

    final commentRef = FirebaseFirestore.instance
        .collection('post')
        .doc(postId)
        .collection('comments')
        .doc();

    final commentId = commentRef.id;

    CommentModel commentData = CommentModel(
        uid: currentUserId,
        commentId: commentId,
        fullName: fullName,
        comment: commentController.text.trim(),
        timestamp: FieldValue.serverTimestamp()
    );

    await commentRef.set(commentData.toJson());

    commentController.clear();
  }

  // Real-time listener for comments
  Stream<List<CommentModel>> getCommentsStream(String postId) {
    return FirebaseFirestore.instance
        .collection('post')
        .doc(postId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return CommentModel.fromJson(doc.data());
      }).toList();
    });
  }


}
