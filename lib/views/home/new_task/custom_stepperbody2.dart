import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/helper/reusable_textfield.dart';
import 'package:energy_services/views/home/new_task/widgets/checkbox.dart';
import 'package:energy_services/views/home/new_task/widgets/heading&textfield.dart';
import 'package:energy_services/views/home/new_task/widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStepperBody2 extends StatelessWidget {
  CustomStepperBody2({
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
                text: 'Engine Running Checks',
                textColor: Colors.white,
              )),
          //Engine Load Factor
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Engine Load Factor'),
                Row(
                  children: [
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'Enter Engine Load',
                      controller: controller.engineLoad,
                      keyboardType: TextInputType.number,
                    )),
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'Engine RPM',
                      controller: controller.engineRPM,
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
                HeadingAndTextfield(
                  title: 'Ignition Timing, BTDC',
                  controller: controller.ignitionTiming,
                ),
              ],
            ),
          ),
          //Exhaust Gas Sample
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Exhaust Gas Sample'),
                CustomCheckboxWidget(
                  question: 'Exhaust Gas Sample (As Found)',
                  options: const ['Oxygen', 'CO', 'NOx'],
                  selectedValues: controller.exhaustGasSampleFound,
                ),
                Row(
                  children: [
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'LB (Left Bank)',
                      controller: controller.leftBankFound,
                      keyboardType: TextInputType.number,
                    )),
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'RB(Right Bank)',
                      controller: controller.rightBankFound,
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
                CustomCheckboxWidget(
                  question: 'Exhaust Gas Sample (As ADJUSTED )',
                  options: const ['Oxygen', 'CO', 'NOx'],
                  selectedValues: controller.exhaustGasSampleAdjusted,
                ),
                Row(
                  children: [
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'LB (Left Bank)',
                      controller: controller.leftBankAdjusted,
                      keyboardType: TextInputType.number,
                    )),
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'RB(Right Bank)',
                      controller: controller.rightBankAdjusted,
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
              ],
            ),
          ),
          //Fuel Quality
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Fuel Quality in Use'),
                HeadingAndTextfield(
                  title: 'BTU Value',
                  controller: controller.btuValue,
                ),
                CustomRadioButton(
                    options: const ['C', 'F'],
                    selectedOption: controller.selectedBtuValue,
                    heading: 'BTU Value')
              ],
            ),
          ),
          //Cylinder Exhaust Pyrometer
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Cylinder Exhaust Pyrometer Temperature Readings'),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '1 ',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature1,
                    ),
                    NumberWithTextField(
                      number: '2 ',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature2,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '3 ',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature3,
                    ),
                    NumberWithTextField(
                      number: '4 ',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature4,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '5 ',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature5,
                    ),
                    NumberWithTextField(
                      number: '6 ',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature6,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '7 ',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature7,
                    ),
                    NumberWithTextField(
                      number: '8 ',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature8,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '9 ',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature9,
                    ),
                    NumberWithTextField(
                      number: '10',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature10,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '11',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature11,
                    ),
                    NumberWithTextField(
                      number: '12',
                      controller:
                          controller.cylinderExhaustPyrometerTemperature12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Turbo Temperatures
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Turbo Temperatures'),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.lbTurboIn,
                              heading: 'LB TURBO IN'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.lbTurboInTemp,
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.rbTurboIn,
                              heading: 'RB TURBO IN'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.rbTurboInTemp,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.black54),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.lbTurboOut,
                              heading: 'LB TURBO OUT'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.lbTurboOutTemp,
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.rbTurboOut,
                              heading: 'RB TURBO OUT'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.rbTurboOutTemp,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //MissFireDetected
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Misfires Detected'),
                CustomRadioButton(
                    options: const ['yes', 'no'],
                    selectedOption: controller.missFireDetected,
                    heading: 'Missfires Detected?')
              ],
            ),
          ),
          //BurnTimes
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Burn Times'),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '1 ',
                      controller: controller.burnTemperature1,
                    ),
                    NumberWithTextField(
                      number: '2 ',
                      controller: controller.burnTemperature2,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '3 ',
                      controller: controller.burnTemperature3,
                    ),
                    NumberWithTextField(
                      number: '4 ',
                      controller: controller.burnTemperature4,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '5 ',
                      controller: controller.burnTemperature5,
                    ),
                    NumberWithTextField(
                      number: '6 ',
                      controller: controller.burnTemperature6,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '7 ',
                      controller: controller.burnTemperature7,
                    ),
                    NumberWithTextField(
                      number: '8 ',
                      controller: controller.burnTemperature8,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '9 ',
                      controller: controller.burnTemperature9,
                    ),
                    NumberWithTextField(
                      number: '10',
                      controller: controller.burnTemperature10,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumberWithTextField(
                      number: '11',
                      controller: controller.burnTemperature11,
                    ),
                    NumberWithTextField(
                      number: '12',
                      controller: controller.burnTemperature12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Throttle  & Fuel Value Position
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(
                    heading: 'Throttle & Fuel Valve Position'),
                HeadingAndTextfield(
                  title: 'Throttle Actuator Position',
                  controller: controller.throttleActuatorPosition,
                ),
                HeadingAndTextfield(
                  title: 'Fuel Value',
                  controller: controller.fuelValue,
                )
              ],
            ),
          ),
          //Engine Oil
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Engine Oil'),
                HeadingAndTextfield(
                  title: 'Engine Oil Pressure (PSI)',
                  controller: controller.engineOilPressure,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Oil Pressure Differential Across Oil Filter',
                      fontWeight: FontWeight.w600,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: ReUsableTextField(
                                hintText: 'Value',
                                controller:
                                    controller.oilPressureDifferentialTextField,
                                onChanged: (value) {
                                  controller.oilPressureDifferential.value =
                                      value;
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: AppColors.blueTextColor,
                                  value: 'NA',
                                  groupValue:
                                      controller.oilPressureDifferential.value,
                                  onChanged: (value) {
                                    if (value == 'NA') {
                                      controller.oilPressureDifferential.value =
                                          value!;
                                      controller
                                          .oilPressureDifferentialTextField
                                          .clear();
                                    }
                                  },
                                ),
                                CustomTextWidget(text: 'NA', fontSize: 14.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                InOutWidget(
                  heading: 'Oil temperature',
                  inController: controller.oilPressureIn,
                  outController: controller.oilPressureOut,
                ),
                CustomRadioButton(
                    options: const [
                      'LOW',
                      'GOOD',
                      'HIGH',
                    ],
                    selectedOption: controller.oilLevelEngine,
                    heading: 'Oil Level Engine')
              ],
            ),
          ),
          //Engine Coolent
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Engine Coolant'),
                TextfieldWithRadioButtons(
                  heading: 'Engine Coolant Pressure',
                  val1: 'PSI',
                  val2: 'KPA',
                  textController: controller.engineCoolentPressure,
                  radioController: controller.engineCoolentPressureRadioValue,
                ),
                CustomRadioButton(
                    options: const [
                      'LOW',
                      'GOOD',
                      'HIGH',
                    ],
                    selectedOption: controller.jacketWaterLevel,
                    heading: 'Jacket Water Level')
              ],
            ),
          ),
          //Auxiliary Coolant
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Auxiliary Coolant'),
                CustomRadioButton(
                    options: const [
                      'LOW',
                      'GOOD',
                      'HIGH',
                    ],
                    selectedOption: controller.auxiliaryCoolantlevel,
                    heading: 'Auxiliary Coolant level')
              ],
            ),
          ),
          //JacketWaterTemperatures
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Jacket Water Temperatures'),
                InOutWidget(
                  heading: 'Jacketwater Temperatures In & Out (C/F)',
                  inController: controller.jacketWaterTemperaturesIn,
                  outController: controller.jacketWaterTemperaturesOut,
                ),
                InOutWidget(
                  heading: 'Aux. Coolant Temperatures In & Out (C/F)',
                  inController: controller.auxCoolentTemperaturesIn,
                  outController: controller.auxCoolentTemperaturesOut,
                ),
              ],
            ),
          ),
          //Air Intakes
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Air Intake'),
                TextfieldWithRadioButtons(
                  heading: 'Inlet Air Temp',
                  val1: 'C',
                  val2: 'F',
                  textController: controller.inletAirTempTextfield,
                  radioController: controller.inletAirTempRadio,
                ),
                TextfieldWithRadioButtons(
                  heading: 'Inlet Air Pressure',
                  val1: 'PSI',
                  val2: 'KPA',
                  textController: controller.inletAirPressureTextfield,
                  radioController: controller.inletAirPressureRadio,
                ),
                HeadingAndTextfield(
                  title: 'Primary Fuel Pressure (PSI)',
                  controller: controller.primaryFuelPressure,
                ),
              ],
            ),
          ),
          //Air/Fuel Ratio & Crankcase Pressure
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Air/Fuel Ratio & Crankcase Pressure'),
                HeadingAndTextfield(
                  title: 'Actual Air to Fuel Ratio (%)',
                  controller: controller.actualAirToFuelRatio,
                ),
                HeadingAndTextfield(
                  title: 'Crankcase Pressure / Vacuum',
                  controller: controller.crankcasePressure,
                ),
                TextfieldWithRadioButtons(
                  heading: 'Airfilter Restriction',
                  val1: 'RB',
                  val2: 'LB',
                  textController: controller.airFilterRestrictionTextfield,
                  radioController: controller.airFilterRestrictionRadio,
                ),
                CustomRadioButton(
                    options: const ['LOW', 'GOOD', 'HIGH', 'NA'],
                    selectedOption: controller.hydrolicOil,
                    heading: 'Hydraulic Oil')
              ],
            ),
          ),
          //Leaks Found
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Leaks Found'),
                CustomRadioButton(
                    options: const ['yes', 'no'],
                    selectedOption: controller.leaksFound,
                    heading: 'Any Leaks Found?'),
                CustomTextWidget(text: 'If yes then describe'),
                CheckboxWithTextfield(
                  heading: 'Oil',
                  isSelected: controller.isOilSelected,
                  controller: controller.oilDescription,
                ),
                CheckboxWithTextfield(
                  heading: 'Coolant',
                  isSelected: controller.isCoolantSelected,
                  controller: controller.coolantDescription,
                ),
                CheckboxWithTextfield(
                  heading: 'Gass',
                  isSelected: controller.isGassSelected,
                  controller: controller.gassDescription,
                ),
                CheckboxWithTextfield(
                  heading: 'Exhaust',
                  isSelected: controller.isExhaustSelected,
                  controller: controller.exhaustDescription,
                ),
                CheckboxWithTextfield(
                  heading: 'Air',
                  isSelected: controller.isAirSelected,
                  controller: controller.airDescription,
                ),
              ],
            ),
          ),
          //Excessive vibration & odd noises
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(
                      heading: 'Excessive vibration & odd noises'),
                  CustomRadioButton(
                    options: const ['yes', 'no'],
                    selectedOption: controller.excessiveVibrationAndOddNoises,
                    heading: 'Excessive vibration & odd noises?',
                  ),
                  CustomTextWidget(text: 'If yes then describe'),
                  ReUsableTextField(
                    maxLines: 3,
                    hintText: 'Describe Excessive Vibration & Odd Noises',
                    showBackgroundShadow:
                        controller.excessiveVibrationAndOddNoises.value ==
                            'yes',
                    readOnly:
                        controller.excessiveVibrationAndOddNoises.value == 'no',
                    controller:
                        controller.excessiveVibrationAndOddNoisesDescription,
                  ),
                ],
              ),
            ),
          ),
          //Problems with Driver
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Problems with Driver'),
                  CustomRadioButton(
                    options: const ['yes', 'no'],
                    selectedOption: controller.problemsWithDriver,
                    heading: 'Problem found with Driver during running checks?',
                  ),
                  CustomTextWidget(text: 'If yes then describe'),
                  ReUsableTextField(
                    maxLines: 3,
                    hintText:
                        'Describe Problem found with Driver during running checks',
                    showBackgroundShadow:
                        controller.problemsWithDriver.value == 'yes',
                    readOnly: controller.problemsWithDriver.value == 'no',
                    controller: controller.problemsWithDriverDescription,
                  ),
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
          ),
        ],
      ),
    );
  }
}

class NumberWithTextField extends StatelessWidget {
  final String number;
  final TextEditingController? controller;
  const NumberWithTextField({super.key, required this.number, this.controller});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: HeadingAndTextfieldInRow(
        title: number,
        hintText: 'Temperature',
        controller: controller,
      ),
    );
  }
}

class CheckboxWithTextfield extends StatelessWidget {
  final String heading;
  final TextEditingController? controller;
  final RxBool isSelected;
  const CheckboxWithTextfield(
      {super.key,
      required this.heading,
      this.controller,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          SizedBox(
            width: 100,
            child: Column(
              children: [
                CustomTextWidget(text: heading),
                Checkbox(
                  value: isSelected.value,
                  onChanged: (value) {
                    isSelected.value = value!;
                  },
                ),
              ],
            ),
          ),
          Flexible(
              child: ReUsableTextField(
            hintText: 'Description',
            maxLines: 2,
            controller: controller,
            showBackgroundShadow: isSelected.value ? true : false,
            readOnly: isSelected.value ? false : true,
          ))
        ],
      ),
    );
  }
}

class TextfieldWithRadioButtons extends StatelessWidget {
  final String heading;
  final String val1;
  final String val2;
  final TextEditingController? textController;
  final RxString? radioController;
  const TextfieldWithRadioButtons({
    super.key,
    required this.heading,
    this.textController,
    this.radioController,
    required this.val1,
    required this.val2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: heading,
          fontWeight: FontWeight.w600,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ReUsableTextField(
                hintText: 'Value',
                controller: textController,
              ),
            ),
            Flexible(
              child: CustomRadioButton(
                  options: [val1],
                  selectedOption: radioController!,
                  heading: ''),
            ),
            Flexible(
              child: CustomRadioButton(
                  options: [val2],
                  selectedOption: radioController!,
                  heading: ''),
            ),
          ],
        ),
      ],
    );
  }
}

class InOutWidget extends StatelessWidget {
  final String heading;
  final TextEditingController? inController;
  final TextEditingController? outController;
  const InOutWidget(
      {super.key,
      required this.heading,
      this.inController,
      this.outController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: heading,
          fontWeight: FontWeight.w600,
          maxLines: 2,
        ),
        Row(
          children: [
            Flexible(
              child: HeadingAndTextfieldInRow(
                title: 'In',
                hintText: 'Value',
                controller: inController,
              ),
            ),
            Flexible(
              child: HeadingAndTextfieldInRow(
                title: 'Out',
                hintText: 'Value',
                controller: outController,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ContainerHeading extends StatelessWidget {
  final String heading;
  const ContainerHeading({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: CustomTextWidget(
        text: heading,
        maxLines: 2,
        textAlign: TextAlign.center,
      )),
    );
  }
}
