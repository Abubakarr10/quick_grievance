import 'package:flutter/material.dart';

import '../../model/course.dart';
import 'widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(

        ),
      ),
    );
  }
}
