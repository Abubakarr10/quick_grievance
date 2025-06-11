
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityController extends GetxController{


  RxBool isLike = false.obs;
  RxBool isCommentOpen = false.obs;

  TextEditingController commentController = TextEditingController();


}