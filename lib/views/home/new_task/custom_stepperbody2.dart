import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ReUsableContainer(
              color: AppColors.blueTextColor,
              borderRadius: 8.0,
              child: CustomTextWidget(
                text: 'Engine Running Checks',
                textColor: Colors.white,
              )),
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
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Engine Oil'),
                HeadingAndTextfield(title: 'Engine Oil Pressure (PSI)'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Oil Pressure Differential Across Oil Filter',
                      fontWeight: FontWeight.w600,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: ReUsableTextField(
                                  hintText: 'Value',
                                ))),
                        Flexible(
                          child: Row(
                            children: [
                              Radio(
                                activeColor: AppColors.blueTextColor,
                                value: 'NA',
                                groupValue: controller.selectedLocation.value,
                                onChanged: (value) {
                                  controller.selectedLocation.value = value!;
                                },
                              ),
                              CustomTextWidget(text: 'NA', fontSize: 14.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const InOutWidget(heading: 'Oil temperature'),
                CustomRadioButton(
                    options: const [
                      'LOW',
                      'GOOD',
                      'HIGH',
                    ],
                    selectedOption: controller.selectedBtuValue,
                    heading: 'Oil Level Engine')
              ],
            ),
          ),
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Engine Coolant'),
                Row(
                  children: [
                    Flexible(
                      child:
                          HeadingAndTextfield(title: 'Engine Coolent Pressure'),
                    ),
                    Flexible(
                      child: CustomRadioButton(
                          options: const ['PSI'],
                          selectedOption: controller.selectedBtuValue,
                          heading: ''),
                    ),
                    Flexible(
                      child: CustomRadioButton(
                          options: const ['KPA'],
                          selectedOption: controller.selectedBtuValue,
                          heading: ''),
                    ),
                  ],
                ),
                CustomRadioButton(
                    options: const [
                      'LOW',
                      'GOOD',
                      'HIGH',
                    ],
                    selectedOption: controller.selectedBtuValue,
                    heading: 'Jacket Water Level')
              ],
            ),
          ),
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
                    selectedOption: controller.selectedBtuValue,
                    heading: 'Auxiliary Coolant level')
              ],
            ),
          ),
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerHeading(heading: 'Jacket Water Temperatures'),
                InOutWidget(
                  heading: 'Jacketwater Temperatures In & Out (C/F)',
                ),
                InOutWidget(
                    heading: 'Aux. Coolant Temperatures In & Out (C/F)'),
              ],
            ),
          ),
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Air Intake'),
                TextfieldWithRadioButtons(
                  controller: controller,
                  heading: 'Inlet Air Temp',
                ),
                TextfieldWithRadioButtons(
                  controller: controller,
                  heading: 'Inlet Air Pressure',
                ),
                HeadingAndTextfield(title: 'Primary Fuel Pressure (PSI)'),
              ],
            ),
          ),
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Air/Fuel Ratio & Crankcase Pressure'),
                HeadingAndTextfield(title: 'Actual Air to Fuel Ratio (%)'),
                HeadingAndTextfield(title: 'Crankcase Pressure / Vacuum'),
                TextfieldWithRadioButtons(
                  controller: controller,
                  heading: 'Airfilter Restriction',
                ),
                CustomRadioButton(
                    options: const ['LOW', 'GOOD', 'HIGH', 'NA'],
                    selectedOption: controller.selectedLocation,
                    heading: 'Hydraulic Oil')
              ],
            ),
          ),
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Leaks Found'),
                CustomRadioButton(
                    options: const ['yes', 'no'],
                    selectedOption: controller.selectedLocation,
                    heading: 'Any Leaks Found?'),
                CustomTextWidget(text: 'If yes then describe'),
                const CheckboxWithTextfield(heading: 'Oil'),
                const CheckboxWithTextfield(heading: 'Coolant'),
                const CheckboxWithTextfield(heading: 'Gass'),
                const CheckboxWithTextfield(heading: 'Exhaust'),
                const CheckboxWithTextfield(heading: 'Air'),
              ],
            ),
          ),
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Excessive vibration & odd noises'),
                CustomRadioButton(
                    options: const ['yes', 'no'],
                    selectedOption: controller.selectedLocation,
                    heading: 'Excessive vibration & odd noises?'),
                CustomTextWidget(text: 'If yes then describe'),
                ReUsableTextField(
                    maxLines: 3,
                    hintText: 'Describe Excessive Vibration & Odd Noices')
              ],
            ),
          ),
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Problems with Driver'),
                CustomRadioButton(
                    options: const ['yes', 'no'],
                    selectedOption: controller.selectedLocation,
                    heading:
                        'Problem found with Driver during running checks?'),
                CustomTextWidget(text: 'If yes then describe'),
                ReUsableTextField(maxLines: 3, hintText: 'Describe Issues')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NumberWithTextField extends StatelessWidget {
  final String number;
  TextEditingController? controller;
  NumberWithTextField({super.key, required this.number, this.controller});

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
  const CheckboxWithTextfield({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Column(
            children: [
              CustomTextWidget(text: heading),
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        Flexible(
            child: ReUsableTextField(
          hintText: 'Description',
          maxLines: 2,
        ))
      ],
    );
  }
}

class TextfieldWithRadioButtons extends StatelessWidget {
  final String heading;
  const TextfieldWithRadioButtons({
    super.key,
    required this.controller,
    required this.heading,
  });

  final AddTaskController controller;

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
          children: [
            Flexible(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ReUsableTextField(
                      hintText: 'Value',
                    ))),
            Flexible(
              child: Row(
                children: [
                  Radio(
                    activeColor: AppColors.blueTextColor,
                    value: 'F',
                    groupValue: controller.selectedLocation.value,
                    onChanged: (value) {
                      controller.selectedLocation.value = value!;
                    },
                  ),
                  CustomTextWidget(text: 'F', fontSize: 14.0),
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  Radio(
                    activeColor: AppColors.blueTextColor,
                    value: 'F',
                    groupValue: controller.selectedLocation.value,
                    onChanged: (value) {
                      controller.selectedLocation.value = value!;
                    },
                  ),
                  CustomTextWidget(text: 'F', fontSize: 14.0),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class InOutWidget extends StatelessWidget {
  final String heading;
  const InOutWidget({
    super.key,
    required this.heading,
  });

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
              ),
            ),
            Flexible(
              child: HeadingAndTextfieldInRow(
                title: 'Out',
                hintText: 'Value',
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
