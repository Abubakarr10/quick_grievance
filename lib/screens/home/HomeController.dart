import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController{

  RxString formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now()).obs;
  RxString dayOfWeek = DateFormat('EEEE').format(DateTime.now()).obs;

}