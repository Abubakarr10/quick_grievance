import 'package:flutter/material.dart';
import '../../../conts/app_colors.dart';
import '../../../conts/app_height_width.dart';
import '../../app_widgets/app_text_widget.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//
//   // final authService = AuthService();
//   //
//   // EditUserController editUserController = Get.put(EditUserController());
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   editUserController.fetchUserData();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

class IconTextWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const IconTextWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 30),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              AppTextWidget(
                  title: title, fontSize: 20, fontWeight: FontWeight.w700)
            ],
          ),
          const Divider(
            thickness: 1, color: secondaryColor,
          )
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          /// Text => Settings
          Padding(
            padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
            child: AppTextWidget(
                title: 'Settings',
                fontSize: heightX*.03,
                textColor: textColor,
                fontWeight: FontWeight.w700),
          ),

          const IconTextWidget(
            icon: Icons.person_2_outlined,
            title: 'Account',
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 05),
            child: ListTile(
              onTap: () {
                //  Get.to(()=> const EditProfileScreen());
              },
              title: AppTextWidget(
                title: 'Edit profile',
                fontSize: heightX*.018,
                fontWeight: FontWeight.w500,
                textColor: pureBlack,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: secondaryColor,
                size: heightX*.025,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 05),
            child: ListTile(
              onTap: () {
                // Get.to(()=> const UserAddressScreen());
              },
              title: AppTextWidget(
                title: 'Delivery address',
                fontSize: heightX*.018,
                fontWeight: FontWeight.w500,
                textColor: pureBlack,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: secondaryColor,
                size: heightX*.025,
              ),
            ),
          ),

          const IconTextWidget(
            icon: Icons.light_mode_outlined,
            title: 'Themes',
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 05),
            child: ListTile(
              onTap: () {
                // Get.to(()=>const ThemeScreen());
              },
              title: AppTextWidget(
                title: 'Light mode',
                fontSize: heightX*.018,
                fontWeight: FontWeight.w500,
                textColor: pureBlack,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: secondaryColor,
                size: heightX*.025,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
              width: 180,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 10,
                    shadowColor: primaryColor,
                  ),
                  onPressed: () async{
                    // await authService.logout();
                    // await saveLoginStatus(false);
                    // Get.off(()=> const LoginScreen());
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: pureBlack,
                        size: 22,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      AppTextWidget(
                          title: 'Logout',
                          fontSize: 20,
                          textColor: pureBlack,
                          fontWeight: FontWeight.w700)
                    ],
                  )),
            ),
          ),

        ],
      ),
    );
  }
}


