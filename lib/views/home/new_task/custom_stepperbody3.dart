import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/helper/reusable_textfield.dart';
import 'package:energy_services/views/home/new_task/custom_stepperbody2.dart';
import 'package:energy_services/views/home/new_task/widgets/heading&textfield.dart';
import 'package:energy_services/views/home/new_task/widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStepperBody3 extends StatelessWidget {
  CustomStepperBody3({
    super.key,
  });

  final AddTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: ListView(
        children: [
          ReUsableContainer(
              color: AppColors.blueTextColor,
              borderRadius: 8.0,
              child: CustomTextWidget(
                text: 'ENGINE TUNE UP AND SET POINT SPECIFICATIONS',
                textColor: Colors.white,
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
          //Hot Compression Test
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Hot Compression Test'),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '1 ',
                      controller: controller.hotCompressionTemperature1,
                    ),
                    NumberWithTextField(
                      number: '2 ',
                      controller: controller.hotCompressionTemperature2,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '3 ',
                      controller: controller.hotCompressionTemperature3,
                    ),
                    NumberWithTextField(
                      number: '4 ',
                      controller: controller.hotCompressionTemperature4,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '5 ',
                      controller: controller.hotCompressionTemperature5,
                    ),
                    NumberWithTextField(
                      number: '6 ',
                      controller: controller.hotCompressionTemperature6,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '7 ',
                      controller: controller.hotCompressionTemperature7,
                    ),
                    NumberWithTextField(
                      number: '8 ',
                      controller: controller.hotCompressionTemperature8,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '9 ',
                      controller: controller.hotCompressionTemperature9,
                    ),
                    NumberWithTextField(
                      number: '10',
                      controller: controller.hotCompressionTemperature10,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '11',
                      controller: controller.hotCompressionTemperature11,
                    ),
                    NumberWithTextField(
                      number: '12',
                      controller: controller.hotCompressionTemperature12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Value Set
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Value Set'),
                TextfieldWithRadioButtons(
                  heading: 'Intake',
                  val1: 'Hydraulic',
                  val2: 'Solid',
                  textController: controller.intakeValueSet,
                  radioController: controller.intakeValueSetRadioValue,
                ),
                TextfieldWithRadioButtons(
                  heading: 'Exhaust',
                  val1: 'Hydraulic',
                  val2: 'Solid',
                  textController: controller.exhaustValueSet,
                  radioController: controller.exhaustValueSetRadioValue,
                ),
                CustomRadioButton(
                  heading: 'Major Value Recession Detected?',
                  options: const ['yes', 'no'],
                  selectedOption: controller.majorValueRecessionDetected,
                ),
                CustomRadioButton(
                  heading: 'Boroscope Recommended?',
                  options: const ['yes', 'no'],
                  selectedOption: controller.boroscopeRecommended,
                ),
                CustomRadioButton(
                  heading: 'Boroscope Inspection Completed?',
                  options: const ['yes', 'no'],
                  selectedOption: controller.boroscopeInspectionCompleted,
                ),
              ],
            ),
          ),
          //Sparkplugs
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Sparkplugs'),
                CustomRadioButton(
                  heading: 'Install New Sparkplugs?',
                  options: const ['yes', 'no', 'clean', 'REGAP'],
                  selectedOption: controller.installNewWires,
                ),
                HeadingAndTextfield(
                  title: 'Sparkplug Gap',
                  controller: controller.sparkplugGap,
                ),
                CustomRadioButton(
                  heading: 'Sparkplug Extension(s) Installed?',
                  options: const [
                    'yes',
                    'no',
                    'replaced boots',
                    'replaced O rings',
                    'NA'
                  ],
                  selectedOption: controller.sparkplugExtensionInstalled,
                ),
                CustomRadioButton(
                  heading: 'Any New Extensions Installed?',
                  options: const [
                    'yes',
                    'no',
                    'NA',
                  ],
                  selectedOption: controller.newExtensionInstalled,
                ),
                ReUsableTextField(
                  hintText: 'List of Replaced Extensions',
                  controller: controller.listOfNewExtensionInstalled,
                ),
                CustomRadioButton(
                  heading: 'Sparkplug Wire Condition?',
                  options: const [
                    'poor',
                    'fair',
                    'good',
                  ],
                  selectedOption: controller.sparkplugWireCondition,
                ),
                ReUsableTextField(
                  hintText: 'List of Replaced Extensions',
                  controller: controller.listOfSparkplugWireCondition,
                )
              ],
            ),
          ),
          //Connections
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Connections'),
                CustomRadioButton(
                  heading: 'Cannon Plug Connectors Tight?',
                  options: const [
                    'yes',
                    'no',
                  ],
                  selectedOption: controller.cannonPlugConnectorsTight,
                ),
                HeadingAndTextfield(
                  title: 'List of Transformer Coils Replaced',
                  controller: controller.listOfTransformerCoilsReplaced,
                ),
              ],
            ),
          ),
          //Crankcase
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Crankcase'),
                CustomRadioButton(
                  heading: 'Crankcase Breather Inspection',
                  options: const ['yes', 'no', 'NA'],
                  selectedOption: controller.crankcaseBreatherInspection,
                ),
                CustomRadioButton(
                  heading: 'New Breather Element Installed?',
                  options: const ['yes', 'no', 'NA'],
                  selectedOption: controller.newBreatherElementInstalled,
                ),
              ],
            ),
          ),
          // Belts and Coolers
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Belts and Coolers'),
                CustomRadioButton(
                  heading:
                      'Check All Cooler Fan Jackshaft Drive Belts and Tensioner Condition',
                  options: const [
                    'yes',
                    'no',
                    'NA',
                  ],
                  selectedOption: controller.checkAllCanonFan,
                ),
                ReUsableTextField(
                  hintText: 'List of Replaced items',
                  controller: controller.listOfCheckAllCanonFan,
                )
              ],
            ),
          ),
          //Coolant System Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Coolant System Check'),
                CustomRadioButton(
                  heading:
                      'Check all water pump weep holes for any signs of coolant leakage?',
                  options: const [
                    'yes',
                    'no',
                    'NA',
                  ],
                  selectedOption: controller.coolantSystemCheck,
                ),
              ],
            ),
          ),
          //Lubrication System Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Lubrication System Check'),
                CustomRadioButton(
                  heading:
                      'Grease all points and check all auto greasers for function?',
                  options: const [
                    'yes',
                    'no',
                    'replaced',
                  ],
                  selectedOption: controller.lubricationSystemCheck,
                ),
              ],
            ),
          ),
          //Cooling System Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Cooling System Check'),
                CustomRadioButton(
                  heading:
                      'Grease all points and check all auto greasers for function?',
                  options: const [
                    'yes',
                    'no',
                    'replaced',
                  ],
                  selectedOption: controller.coolingSystemCheck,
                ),
              ],
            ),
          ),
          //Fuel System Inspection
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Fuel System Inspection'),
                CustomRadioButton(
                  heading: 'Check fuel gas filter(s)?',
                  options: const [
                    'yes',
                    'no',
                    'replaced',
                    'return to service',
                    'Replace New'
                  ],
                  selectedOption: controller.checkFuelGasFilter,
                ),
                CustomRadioButton(
                  heading: 'Fuel gas filters found?',
                  options: const [
                    'dry',
                    'wet',
                    'dirty',
                    'waxy',
                  ],
                  selectedOption: controller.fuelGasFilterFound,
                ),
              ],
            ),
          ),
          //Air Filter Inspection
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Air Filter Inspection'),
                CustomRadioButton(
                  heading: 'Air filter(s) inspection?',
                  options: const [
                    'yes',
                    'no',
                    'replaced',
                    'return to service',
                    'Replace New'
                  ],
                  selectedOption: controller.airFilterInspection,
                ),
              ],
            ),
          ),
          //Turbocharger Inspection
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Turbocharger Inspection'),
                CustomRadioButton(
                  heading:
                      'Check turbo air side for excessive endplay, axial play, and carbon scraping?',
                  options: const ['yes', 'no', 'NA'],
                  selectedOption: controller.turboChargerInspection,
                ),
              ],
            ),
          ),
          //Carburetor and Fuel Injection Inspection
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Carburetor and Fuel Injection Inspection'),
                CustomRadioButton(
                  heading: 'Carburetor internal cleaning & inspection?',
                  options: const [
                    'yes',
                    'no',
                    'return to service',
                    'replace internals new'
                  ],
                  selectedOption:
                      controller.carburetorInternalCleaningInspection,
                ),
              ],
            ),
          ),
          //Engine Oil Maintenance
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Engine Oil Maintenance'),
                CustomRadioButton(
                  heading: 'Engine oil filter change?',
                  options: const ['yes', 'no', 'Stainless', 'Sock', 'Canister'],
                  selectedOption: controller.engineOilFilterChange,
                ),
                CustomRadioButton(
                  heading: 'Engine oil filter change?',
                  options: const ['Clean', 'Metal Flake', 'Coolant', 'NA'],
                  selectedOption: controller.engineOilFilterChange2,
                ),
                CustomRadioButton(
                  heading: 'Oil cooler drained?',
                  options: const ['yes', 'no', 'NA'],
                  selectedOption: controller.oilCoolerDrained,
                ),
              ],
            ),
          ),
          //Hydraulic System Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Hydraulic System Check'),
                CustomRadioButton(
                  heading: 'Hydraulic oil filter change?',
                  options: const [
                    'yes',
                    'no',
                  ],
                  selectedOption: controller.hydraulicOilFilterChange,
                ),
                CustomRadioButton(
                  heading: 'Hydraulic oil new?',
                  options: const [
                    'yes',
                    'no',
                  ],
                  selectedOption: controller.hydraulicOilNew,
                ),
              ],
            ),
          ),
          //Miscellaneous Checks
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Miscellaneous Checks'),
                CustomRadioButton(
                    heading: 'Engine oil system primed & oil level correct?',
                    options: const ['yes', 'no'],
                    selectedOption: controller.engineOilSystemPrimed),
                CustomRadioButton(
                    heading: 'Oil drain isolation valves shut in?',
                    options: const ['yes', 'no'],
                    selectedOption: controller.oilDrainIsolationValvesShutIn),
                CustomRadioButton(
                    heading: 'Day tank filters installed new?',
                    options: const ['yes', 'no', 'NA'],
                    selectedOption: controller.dayTankFiltersInstalledNew),
                CustomRadioButton(
                    heading: 'Day tank values open?',
                    options: const ['yes', 'no'],
                    selectedOption: controller.dayTankValvesOpen),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                          buttonText: 'BACK',
                          usePrimaryColor: true,
                          onTap: () {
                            controller.previousPage();
                          }),
                    ),
                    Expanded(
                      child: CustomButton(
                          buttonText: 'Next',
                          onTap: () {
                            controller.nextPage();
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
