import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController{

  RxString formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now()).obs; // e.g. 21 May 2025
  RxString dayOfWeek = DateFormat('EEEE').format(DateTime.now()).obs; // e.g. Wednesday

}