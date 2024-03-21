import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  var activePageIndex = 0.obs;
  final ScrollController scrollController = ScrollController();
  RxBool isScrolledUp = false.obs;
  double _previousScrollPosition = 0.0;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      double currentScrollPosition = scrollController.position.pixels;
      if (currentScrollPosition > _previousScrollPosition) {
        // Scrolling down
        isScrolledUp.value = false;
      } else {
        // Scrolling up
        isScrolledUp.value = true;
      }
      _previousScrollPosition = currentScrollPosition;
    });
  }

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

  //Page2
  //Engine Load Factor
  TextEditingController engineLoad = TextEditingController();
  TextEditingController engineRPM = TextEditingController();
  TextEditingController ignitionTiming = TextEditingController();

  //Exhaust Gas Sample
  var exhaustGasSampleFound = <String>[].obs; //Checkbox
  TextEditingController leftBankFound = TextEditingController();
  TextEditingController rightBankFound = TextEditingController();
  var exhaustGasSampleAdjusted = <String>[].obs; //Checkbox
  TextEditingController leftBankAdjusted = TextEditingController();
  TextEditingController rightBankAdjusted = TextEditingController();

  //Fuel Quality
  TextEditingController btuValue = TextEditingController();
  RxString selectedBtuValue = ''.obs; //RadioButton

  //Cylinder Exhaust Pyrometer
  TextEditingController cylinderExhaustPyrometerTemperature1 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature2 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature3 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature4 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature5 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature6 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature7 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature8 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature9 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature10 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature11 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature12 =
      TextEditingController();

  //Turbo Temperatures
  RxString lbTurboIn = ''.obs; //RadioButton
  TextEditingController lbTurboInTemp = TextEditingController();
  RxString rbTurboIn = ''.obs; //RadioButton
  TextEditingController rbTurboInTemp = TextEditingController();
  RxString lbTurboOut = ''.obs; //RadioButton
  TextEditingController lbTurboOutTemp = TextEditingController();
  RxString rbTurboOut = ''.obs; //RadioButton
  TextEditingController rbTurboOutTemp = TextEditingController();

  //MissFireDetected
  RxString missFireDetected = ''.obs; //RadioButton

  //BurnTimes
  TextEditingController burnTemperature1 = TextEditingController();
  TextEditingController burnTemperature2 = TextEditingController();
  TextEditingController burnTemperature3 = TextEditingController();
  TextEditingController burnTemperature4 = TextEditingController();
  TextEditingController burnTemperature5 = TextEditingController();
  TextEditingController burnTemperature6 = TextEditingController();
  TextEditingController burnTemperature7 = TextEditingController();
  TextEditingController burnTemperature8 = TextEditingController();
  TextEditingController burnTemperature9 = TextEditingController();
  TextEditingController burnTemperature10 = TextEditingController();
  TextEditingController burnTemperature11 = TextEditingController();
  TextEditingController burnTemperature12 = TextEditingController();

  //Throttle  & Fuel lValve Position
  TextEditingController throttleActuatorPosition = TextEditingController();
  TextEditingController fuelValue = TextEditingController();

  //Engine Oil
  TextEditingController engineOilPressure = TextEditingController();
  RxString oilPressureDifferential = ''.obs; //RadioButton
  TextEditingController oilPressureIn = TextEditingController();
  TextEditingController oilPressureOut = TextEditingController();
  RxString oilLevelEngine = ''.obs; //RadioButton

  //Engine Coolent
  TextEditingController engineCoolentPressure = TextEditingController();
  RxString jacketWaterLevel = ''.obs; //RadioButton

  //Auxiliary Coolant
  RxString auxiliaryCoolantlevel = ''.obs; //RadioButton

  //JacketWaterTemperatures
  TextEditingController jacketWaterTemperaturesIn = TextEditingController();
  TextEditingController jacketWaterTemperaturesOut = TextEditingController();
  TextEditingController auxCoolentTemperaturesIn = TextEditingController();
  TextEditingController auxCoolentTemperaturesOut = TextEditingController();

  //Air Intakes
  RxString inletAirTemp = ''.obs; //RadioButton
  RxString inletAirPressure = ''.obs; //RadioButton
  TextEditingController primaryFuelPressure = TextEditingController();

  //Air/Fuel Ratio & Crankcase Pressure
  TextEditingController actualAirToFuelRatio = TextEditingController();
  TextEditingController crankcasePressure = TextEditingController();
  RxString airFilterRestriction = ''.obs; //RadioButton
  RxString hydrolicOil = ''.obs; //RadioButton

  //Leaks Found
  RxString leaksFound = ''.obs; //RadioButton
  TextEditingController oilDescription = TextEditingController();
  TextEditingController coolantDescription = TextEditingController();
  TextEditingController gassDescription = TextEditingController();
  TextEditingController exhaustDescription = TextEditingController();
  TextEditingController airDescription = TextEditingController();

  //Excessive vibration & odd noises
  RxString excessiveVibrationAndOddNoises = ''.obs; //RadioButton
  TextEditingController excessiveVibrationAndOddNoisesDescription =
      TextEditingController();

  //Problems with Driver
  RxString problemsWithDriver = ''.obs; //RadioButton
  TextEditingController problemsWithDriverDescription = TextEditingController();

  //Page3

  //Page4

  void setActivePage(int index) {
    activePageIndex.value = index;
  }

  void toggleCheckbox(String value, RxList<String> list) {
    if (list.contains(value)) {
      list.remove(value);
    } else {
      list.add(value);
    }
    update();
  }

  void nextPage() {
    if (activePageIndex.value < 3) {
      activePageIndex.value++;
      debugPrint(activePageIndex.value.toString());
    }
  }

  void previousPage() {
    if (activePageIndex.value > 0) {
      activePageIndex.value--;
      debugPrint(activePageIndex.value.toString());
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
