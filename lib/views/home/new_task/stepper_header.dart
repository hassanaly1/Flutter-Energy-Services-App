import 'package:easy_stepper/easy_stepper.dart';
import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepperHeader extends StatelessWidget {
  const StepperHeader({
    super.key,
    required this.controller,
  });

  final AddTaskController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(255, 220, 105, 0.4),
                Color.fromRGBO(86, 127, 255, 0.4),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 8.8, right: 8.0),
            child: EasyStepper(
              activeStep: controller.activePageIndex.value,
              disableScroll: true,
              padding: EdgeInsets.zero,
              internalPadding: 4.0,
              enableStepTapping: false,
              loadingAnimation: 'assets/lottie/loading-animation.json',
              stepShape: StepShape.circle,
              borderThickness: 2,
              stepRadius: 35,
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
                        opacity:
                            controller.activePageIndex.value >= 0 ? 1 : 0.3,
                        child: Icon(controller.activePageIndex.value >= 0
                            ? Icons.done
                            : Icons.hourglass_empty))),
                EasyStep(
                    customStep: Opacity(
                        opacity:
                            controller.activePageIndex.value >= 1 ? 1 : 0.3,
                        child: Icon(controller.activePageIndex.value >= 1
                            ? Icons.done
                            : Icons.hourglass_empty))),
                EasyStep(
                    customStep: Opacity(
                        opacity:
                            controller.activePageIndex.value >= 2 ? 1 : 0.3,
                        child: Icon(controller.activePageIndex.value >= 2
                            ? Icons.done
                            : Icons.hourglass_empty))),
                EasyStep(
                    customStep: Opacity(
                        opacity:
                            controller.activePageIndex.value >= 3 ? 1 : 0.3,
                        child: Icon(controller.activePageIndex.value >= 3
                            ? Icons.done
                            : Icons.hourglass_empty))),
              ],
              onStepReached: (index) {
                controller.setActivePage(index);
              },
            ),
          ),
        ));
  }
}
