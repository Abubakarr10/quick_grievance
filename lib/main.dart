import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quick_grievance/conts/routes/routes.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quick_grievance/repository/share_preferences/sp_controller.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/user/UserController.dart';
import 'conts/bindings/all_bindings.dart';
import 'firebase_options.dart';

// var directory = await getApplicationDocumentsDirectory();
// Hive.init(directory.path);

// await Hive.initFlutter();
// Hive.registerAdapter(FoodModelAdapter());
// await Hive.openBox<FoodModel>('Food');
// await Hive.openBox<FoodModel>('Favourite');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quick Grievance',
      debugShowCheckedModeBanner: false,
      initialBinding: AllBindings(),
      getPages: pages,
      initialRoute: initialScreen,
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
