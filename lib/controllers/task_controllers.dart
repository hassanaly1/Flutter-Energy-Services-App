import 'package:energy_services/models/single_part_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

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

  //-----------------------------------------------------------------------//

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

  //-----------------------------------------------------------------------//

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

  //Throttle  & Fuel Value Position
  TextEditingController throttleActuatorPosition = TextEditingController();
  TextEditingController fuelValue = TextEditingController();

  //Engine Oil
  TextEditingController engineOilPressure = TextEditingController();
  RxString oilPressureDifferential = ''.obs; //RadioButton
  TextEditingController oilPressureDifferentialTextField =
      TextEditingController();
  TextEditingController oilPressureIn = TextEditingController();
  TextEditingController oilPressureOut = TextEditingController();
  RxString oilLevelEngine = ''.obs; //RadioButton

  //Engine Coolent
  TextEditingController engineCoolentPressure = TextEditingController();
  RxString engineCoolentPressureRadioValue = ''.obs; //RadioButton
  RxString jacketWaterLevel = ''.obs; //RadioButton

  //Auxiliary Coolant
  RxString auxiliaryCoolantlevel = ''.obs; //RadioButton

  //JacketWaterTemperatures
  TextEditingController jacketWaterTemperaturesIn = TextEditingController();
  TextEditingController jacketWaterTemperaturesOut = TextEditingController();
  TextEditingController auxCoolentTemperaturesIn = TextEditingController();
  TextEditingController auxCoolentTemperaturesOut = TextEditingController();

  //Air Intakes
  TextEditingController inletAirTempTextfield = TextEditingController();
  RxString inletAirTempRadio = ''.obs; //RadioButton
  TextEditingController inletAirPressureTextfield = TextEditingController();
  RxString inletAirPressureRadio = ''.obs; //RadioButton
  TextEditingController primaryFuelPressure = TextEditingController();

  //Air/Fuel Ratio & Crankcase Pressure
  TextEditingController actualAirToFuelRatio = TextEditingController();
  TextEditingController crankcasePressure = TextEditingController();
  TextEditingController airFilterRestrictionTextfield = TextEditingController();
  RxString airFilterRestrictionRadio = ''.obs; //RadioButton
  RxString hydrolicOil = ''.obs; //RadioButton

  //Leaks Found
  RxString leaksFound = ''.obs; //RadioButton
  RxBool isOilSelected = false.obs;
  TextEditingController oilDescription = TextEditingController();
  RxBool isCoolantSelected = false.obs;
  TextEditingController coolantDescription = TextEditingController();
  RxBool isGassSelected = false.obs;
  TextEditingController gassDescription = TextEditingController();
  RxBool isExhaustSelected = false.obs;
  TextEditingController exhaustDescription = TextEditingController();
  RxBool isAirSelected = false.obs;
  TextEditingController airDescription = TextEditingController();

  //Excessive vibration & odd noises
  RxString excessiveVibrationAndOddNoises = 'no'.obs; //RadioButton
  TextEditingController excessiveVibrationAndOddNoisesDescription =
      TextEditingController();

  //Problems with Driver
  RxString problemsWithDriver = 'no'.obs; //RadioButton
  TextEditingController problemsWithDriverDescription = TextEditingController();

  //-----------------------------------------------------------------------//

  //Page3

  // Hot Compression Test
  TextEditingController hotCompressionTemperature1 = TextEditingController();
  TextEditingController hotCompressionTemperature2 = TextEditingController();
  TextEditingController hotCompressionTemperature3 = TextEditingController();
  TextEditingController hotCompressionTemperature4 = TextEditingController();
  TextEditingController hotCompressionTemperature5 = TextEditingController();
  TextEditingController hotCompressionTemperature6 = TextEditingController();
  TextEditingController hotCompressionTemperature7 = TextEditingController();
  TextEditingController hotCompressionTemperature8 = TextEditingController();
  TextEditingController hotCompressionTemperature9 = TextEditingController();
  TextEditingController hotCompressionTemperature10 = TextEditingController();
  TextEditingController hotCompressionTemperature11 = TextEditingController();
  TextEditingController hotCompressionTemperature12 = TextEditingController();

  //Value Set
  TextEditingController intakeValueSet = TextEditingController();
  RxString intakeValueSetRadioValue = ''.obs; //RadioButton
  TextEditingController exhaustValueSet = TextEditingController();
  RxString exhaustValueSetRadioValue = ''.obs; //RadioButton
  RxString majorValueRecessionDetected = ''.obs; //RadioButton
  RxString boroscopeRecommended = ''.obs; //RadioButton
  RxString boroscopeInspectionCompleted = ''.obs; //RadioButton

  //Sparkplugs
  RxString installNewWires = ''.obs; //RadioButton
  TextEditingController sparkplugGap = TextEditingController();
  RxString sparkplugExtensionInstalled = ''.obs; //RadioButton
  RxString newExtensionInstalled = ''.obs; //RadioButton
  TextEditingController listOfNewExtensionInstalled = TextEditingController();
  RxString sparkplugWireCondition = ''.obs; //RadioButton
  TextEditingController listOfSparkplugWireCondition = TextEditingController();

  //Connections
  RxString cannonPlugConnectorsTight = ''.obs; //RadioButton
  TextEditingController listOfTransformerCoilsReplaced =
      TextEditingController();

  //Crankcase
  RxString crankcaseBreatherInspection = ''.obs; //RadioButton
  RxString newBreatherElementInstalled = ''.obs; //RadioButton

  // Belts and Coolers
  RxString checkAllCanonFan = ''.obs; //RadioButton
  TextEditingController listOfCheckAllCanonFan = TextEditingController();

  // Coolant System Check
  RxString coolantSystemCheck = ''.obs; //RadioButton

  // Lubrication System Check
  RxString lubricationSystemCheck = ''.obs; //RadioButton

  //Cooling System Check
  RxString coolingSystemCheck = ''.obs; //RadioButton

  //Fuel System Inspection
  RxString checkFuelGasFilter = ''.obs; //RadioButton
  RxString fuelGasFilterFound = ''.obs; //RadioButton

  //Air Filter Inspection
  RxString airFilterInspection = ''.obs; //RadioButton

  //Turbocharger Inspection
  RxString turboChargerInspection = ''.obs; //RadioButton

  //Carburetor and Fuel Injection Inspection
  RxString carburetorInternalCleaningInspection = ''.obs; //RadioButton

  //Engine Oil Maintenance
  RxString engineOilFilterChange = ''.obs; //RadioButton
  RxString engineOilFilterChange2 = ''.obs; //RadioButton
  RxString oilCoolerDrained = ''.obs; //RadioButton

  //Hydraulic System Check
  RxString hydraulicOilFilterChange = ''.obs; //RadioButton
  RxString hydraulicOilNew = ''.obs; //RadioButton

  //Miscellaneous Checks
  RxString engineOilSystemPrimed = ''.obs; //RadioButton
  RxString oilDrainIsolationValvesShutIn = ''.obs; //RadioButton
  RxString dayTankFiltersInstalledNew = ''.obs; //RadioButton
  RxString dayTankValvesOpen = ''.obs; //RadioButton

//-----------------------------------------------------------------------//

  //Page4

  //   Oil Pressure and Level Check
  RxString oilPressureEngineAndGood = ''.obs; //RadioButton
  RxString engineOilLevel = ''.obs; //RadioButton

  //   Coolant System Check
  RxString jacketWaterCoolantLevel = ''.obs; //RadioButton
  RxString auxiliaryCoolantLevel = ''.obs; //RadioButton

  //   Temperature and Pressure Check
  RxString allTempsAndPressuresStableAndNormalRanges = ''.obs; //RadioButton

  //   Noise and Vibration Check
  RxString noisesOrVibrationsDetected = ''.obs; //RadioButton

  //   Exhaust Gas and Manifold Pressure
  RxString engineExhaustGasCheckedAndAdjustedAtMaxLoad = ''.obs; //RadioButton
  TextEditingController documentFinalSetPointExhaustGasOxygenOrCOLevels =
      TextEditingController();
  TextEditingController documentFinalManifoldPressureAndRPM =
      TextEditingController();

  //   Engine Deficiencies for Future Repairs
  RxString engineDeficienciesRadio = 'no'.obs; //RadioButton
  TextEditingController engineDeficienciesTextfield = TextEditingController();

  //   Parts Ordering Status
  RxString partsOrderingStatus = ''.obs; //RadioButton

  //   Add Parts in Table
  TextEditingController partName = TextEditingController();
  TextEditingController partDescription = TextEditingController();
  TextEditingController partQuantity = TextEditingController();
  TextEditingController partVendor = TextEditingController();

  //   List of Parts
  List<SinglePartModel> partsList = <SinglePartModel>[].obs;

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
