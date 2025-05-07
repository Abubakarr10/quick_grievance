import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/routes.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quick_grievance/repository/share_preferences/sp_controller.dart';
import 'firebase_options.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await getLoginStatus();

  runApp(MyApp(isLoggedIn: isLoggedIn));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quick Grievance',
      debugShowCheckedModeBanner: false,
      getPages: pages,
      initialRoute: isLoggedIn == true? entryPointScreen : initialScreen,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEEF1F8),
        primarySwatch: Colors.blue,
        fontFamily: "Intel",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          errorBorder: defaultInputBorder,
        ),
      ),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
