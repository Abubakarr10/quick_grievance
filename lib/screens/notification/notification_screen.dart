import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../../conts/images/app_images.dart';
import '../../conts/routes/screen_names.dart';
import '../../model/notification_model.dart';
import '../../repository/share_preferences/sp_controller.dart';
import '../app_widgets/widgets.dart';
import 'NotificationController.dart';

class NotificationScreen extends GetView<NotificationController> {
  final bool backoff;
  const NotificationScreen({super.key, required this.backoff});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
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
      body: Column(
        children: [

          /// Text => History
          Stack(
            children: [

              Image.asset(appBarVector),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                  child: AppTextWidget(
                      title: 'Notifications',
                      fontSize: heightX*.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),


              // Padding(
              //   padding: EdgeInsets.only(top: heightX*.2),
              //   child: const Card(
              //     color: secondaryColor,
              //     child: ListTile(
              //       title: AppTextWidget(title: 'notification.title',color: Colors.white,),
              //       subtitle: AppTextWidget(title: 'notification.body',color: pureWhite,),
              //       trailing: AppTextWidget(title: 'notification.dateTime',color: Colors.white,),
              //     ),
              //   ),
              // )

            ],
          ),

          StreamBuilder<List<NotificationModel>>(
            stream: controller.getUserNotifications(currentUserId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: SpinKitWidget());
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Column(
                  spacing: 10,
                  children: [
                    Icon(Icons.notifications_off,size: 30,),
                    AppTextWidget(title: 'No notifications.'),
                  ],
                ));
              }

              final notifications = snapshot.data!;

              return Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return  Card(
                      color: secondaryColor,
                      child: ListTile(
                        onTap: (){
                          if(notification.title == 'Slip Approved'){
                            controller.moveToTokenScreen(notification.typeId,'');
                          }else if(notification.title == 'Slip Rejected'){
                            controller.moveToTokenScreen(notification.typeId,notification.title);
                            if (kDebugMode) {
                              print('slip rejected wala hai');
                            }
                          }
                          else if(notification.type == 'complaint'){
                            controller.moveToComplaintDetail(notification.typeId);
                          }
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextWidget(title: notification.title,
                              fontWeight: FontWeight.bold, fontSize: heightX*.018,
                              color: Colors.white,),
                            AppTextWidget(title: notification.dateTime,
                              fontSize: heightX*.012,
                              color: primaryColor,),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextWidget(title: notification.body,color: pureWhite,),
                            const Divider(color: primaryColor,thickness: 1,),
                            AppTextWidget(title: 'Detail: ${notification.description}',color: pureWhite,),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )

        ],
      ),
    );
  }
}
