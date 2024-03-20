import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  var activePageIndex = 0.obs;

  //Page1
  RxString oilSamplesTaken = ''.obs;
  RxString unitOnlineOnArrival = ''.obs;
  RxString selectedLocation = ''.obs;
  TextEditingController setUnits = TextEditingController();
  TextEditingController unitHours = TextEditingController();
  late DateTime selectDate;
  late DateTime selectTime;
  TextEditingController nameOfJourneyMan = TextEditingController();
  TextEditingController jobScope = TextEditingController();
  TextEditingController operationalProblems = TextEditingController();
  TextEditingController engineBrand = TextEditingController();
  TextEditingController modelNumber = TextEditingController();
  TextEditingController serialNumber = TextEditingController();
  TextEditingController arrangementNumber = TextEditingController();

  void setActivePage(int index) {
    activePageIndex.value = index;
  }
}
