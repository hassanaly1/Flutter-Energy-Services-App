import 'package:easy_stepper/easy_stepper.dart';
import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class StepperHeader extends StatelessWidget {
  const StepperHeader({
    super.key,
    required this.controller,
  });

  final AddTaskController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8.8, right: 8.0),
          child: EasyStepper(
            activeStep: controller.activePageIndex.value,
            onStepReached: (index) {
              controller.setActivePage(index);
            },
            disableScroll: true,
            padding: EdgeInsets.zero,
            internalPadding: 4.0,
            enableStepTapping: false,
            loadingAnimation: 'assets/lottie/loading-animation.json',
            stepShape: StepShape.circle,
            borderThickness: 4,
            stepRadius: 35,
            unreachedStepBorderColor: AppColors.blueTextColor.withOpacity(0.3),
            finishedStepBorderType: BorderType.normal,
            finishedStepBorderColor: AppColors.primaryColor,
            finishedStepTextColor: AppColors.primaryColor,
            finishedStepBackgroundColor: AppColors.primaryColor,
            activeStepIconColor: AppColors.primaryColor,
            finishedStepIconColor: AppColors.blueTextColor,
            showLoadingAnimation: true,
            unreachedStepBackgroundColor: Colors.transparent,
            steps: [
              EasyStep(
                  customStep: Opacity(
                      opacity: controller.activePageIndex.value >= 0 ? 1 : 0.3,
                      child: Icon(controller.activePageIndex.value >= 0
                          ? FontAwesomeIcons.circleCheck
                          : FontAwesomeIcons.circleCheck))),
              EasyStep(
                  customStep: Opacity(
                      opacity: controller.activePageIndex.value >= 1 ? 1 : 0.3,
                      child: Icon(controller.activePageIndex.value >= 1
                          ? FontAwesomeIcons.circleCheck
                          : FontAwesomeIcons.circleCheck))),
              EasyStep(
                  customStep: Opacity(
                      opacity: controller.activePageIndex.value >= 2 ? 1 : 0.3,
                      child: Icon(controller.activePageIndex.value >= 2
                          ? FontAwesomeIcons.circleCheck
                          : FontAwesomeIcons.circleCheck))),
              EasyStep(
                  customStep: Opacity(
                      opacity: controller.activePageIndex.value >= 3 ? 1 : 0.3,
                      child: Icon(controller.activePageIndex.value >= 3
                          ? FontAwesomeIcons.circleCheck
                          : FontAwesomeIcons.circleCheck))),
            ],
          ),
        ));
  }
}
