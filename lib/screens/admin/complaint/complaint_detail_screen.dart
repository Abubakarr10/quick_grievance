import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/model/complaint_model.dart';
import 'package:quick_grievance/screens/admin/complaint/AdminComplainController.dart';
import 'package:quick_grievance/screens/image_view/image_view_screen.dart';
import 'package:quick_grievance/screens/mess/vote/VoteController.dart';

import '../../app_widgets/widgets.dart';
import '../../auth/hostelite/signup/widgets/drop_down_button_ff_widget.dart';

class ComplaintDetailScreen extends GetView<AdminComplainController> {
  const ComplaintDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> args = Get.arguments;
    final ComplaintModel arguments = args['data'];
    final String docId = args['docId'];
    final bool isUser = args['isUser'];
    final String isHistory = args['isHistory'];

    Get.put(AdminComplainController());

    controller.complainStatus.value = arguments.status;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              if(isUser == true){
                if(isHistory == 'Last Complaints'){
                  Get.offNamed(historyDetailScreen,arguments: isHistory);
                }else{Get.offNamed(trackScreen);}
              }else{
                Get.offNamed(adminScreen,arguments: 2);
              }
            },
            child: const Icon(Icons.arrow_back_ios_new,color: pureWhite,)),
        title: AppTextWidget(title: 'Complaint Details',color: pureWhite,
          fontWeight: FontWeight.bold, fontSize: heightX*.02,
        ),
        backgroundColor: secondaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: isUser == true? false : true,
        child: Obx(()=>
            Visibility(
          visible: controller.complainStatus.value == 'Pending'? false : true,
          child: ActionButtonWidget(
              label: controller.complainStatus.value == 'Rejected'? 'Rejected' : 'Submit',
              onTap: (){
                controller.updateComplaintStatus(docId);
              }),

        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              Visibility(
                visible: arguments.image == 'none'? false : true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: (){
                      Get.to(const ImageViewScreen(),arguments: arguments);
                    },
                    child: CachedNetworkImageWidget(
                        networkImage: arguments.image,
                        width: widthX, height: heightX*.2),
                  ),
                ),
              ),

              AppTextWidget(title: arguments.description,
                fontSize: heightX*.024, fontWeight: FontWeight.bold,
              ),
              AppTextWidget(title: arguments.submitDate,
                fontSize: heightX*.018,
              ),

              SizedBox(height: heightX*.02,),

              Card(
                color: pureWhite,
                elevation: 10,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person, color: secondaryColor,),
                      title: const AppTextWidget(title: 'Submitted by:'),
                      trailing: AppTextWidget(title: arguments.fullName, fontWeight: FontWeight.bold,),
                    ),
                    ListTile(
                      leading: const Icon(Icons.bed, color: secondaryColor,),
                      title: const AppTextWidget(title: 'Room.No:'),
                      trailing: AppTextWidget(title: arguments.roomNo, fontWeight: FontWeight.bold,),
                    ),
                    ListTile(
                      leading: const Icon(CupertinoIcons.number_circle_fill, color: secondaryColor,),
                      title: const AppTextWidget(title: 'Reg.No:'),
                      trailing: AppTextWidget(title: arguments.regNo, fontWeight: FontWeight.bold,),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone, color: secondaryColor,),
                      title: const AppTextWidget(title: 'Phone.No:'),
                      trailing: AppTextWidget(title: arguments.phoneNo, fontWeight: FontWeight.bold,),
                    ),
                  ],
                ),
              ),

              SizedBox(height: heightX*.01,),

              Card(
                elevation: 15,
                color: secondaryColor,
                shadowColor: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          AppTextWidget(title: 'Complaint Status: ',
                            fontSize: heightX*.02,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          Obx(()=>
                              AppTextWidget(title: controller.complainStatus.value,
                                fontSize: heightX*.018,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                          )
                        ],
                      ),

                      SizedBox(height: heightX*.005,),

                      Visibility(
                        visible: isUser == true? false : true,
                        child: Obx(()=>
                            DropdownButtonFFWidget(
                              isFillColor: true,
                              valueName: 'Complaint Status',
                              onChanged: (value){
                                controller.complainStatus.value = value;
                                controller.index.value = controller.complainStatusList.indexOf(value);

                                if (kDebugMode) {
                                  print('Index ===> ${controller.index.value}');
                                  print('Value ===> $value');
                                  print('Complaint Status ===> ${controller.complainStatus.value}');
                                }
                              },
                              listName: controller.complainStatusList,
                              icon: controller.complainStatusIcons.elementAt(controller.index.value),
                            ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(height: heightX*.01,),


              Card(
                color: pureWhite,
                elevation: 10,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.report_problem, color: Colors.red,),
                      title: const AppTextWidget(title: 'Priority:'),
                      trailing: AppTextWidget(title: arguments.priority, fontWeight: FontWeight.bold,),
                    ),
                    ListTile(
                      leading: const Icon(Icons.type_specimen, color: secondaryColor,),
                      title: const AppTextWidget(title: 'Complaint Type:'),
                      trailing: AppTextWidget(title: arguments.complaintType, fontWeight: FontWeight.bold,),
                    ),

                  ],
                ),
              ),

              SizedBox(height: heightX*.01,),


              Card(
                color: secondaryColor,
                elevation: 10,
                child: Column(
                  children: [
                     ListTile(
                      leading: const Icon(Icons.smart_toy, color: accentColor,
                      size: 30,
                      ),
                      title: AppTextWidget(title: 'AI Analysis:',
                      fontWeight: FontWeight.bold, color: primaryColor,
                        fontSize: heightX*.022,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: AppTextWidget(title: arguments.assistantMessage,
                        fontWeight: FontWeight.w500, color: pureWhite,),
                    ),
                  ],
                ),
              ),



              SizedBox(height: heightX*.07,),

            ],
          ),
        ),
      ),
    );
  }
}
