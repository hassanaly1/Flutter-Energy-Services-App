import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/profile_avatar.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/views/home/new_task/custom_stepperbody1.dart';
import 'package:energy_services/views/home/new_task/custom_stepperbody2.dart';
import 'package:energy_services/views/home/new_task/custom_stepperbody3.dart';
import 'package:energy_services/views/home/new_task/custom_stepperbody4.dart';
import 'package:energy_services/views/home/new_task/stepper_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTaskScreen extends StatelessWidget {
  NewTaskScreen({super.key});

  final AddTaskController controller = Get.put(AddTaskController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(255, 220, 105, 0.4),
                  Color.fromRGBO(86, 127, 255, 0.4),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                  spreadRadius: 5.0,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ]),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: DefaultTabController(
              length: 4,
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  TopSection(controller: controller),
                  BottomPageViewSection(controller: controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required this.controller,
  });

  final AddTaskController controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: false,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        // Custom app bar title widget
        background: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(255, 220, 105, 0.4),
                  Color.fromRGBO(86, 127, 255, 0.4),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                  spreadRadius: 5.0,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: context.width,
                child: ReUsableContainer(
                    color: AppColors.primaryColor,
                    child: CustomTextWidget(
                        text: 'CAT 3600 SERVICE',
                        fontSize: 18.0,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600)),
              ),
              StepperHeader(controller: controller),
            ],
          ),
        ),
      ),
      expandedHeight: 230,
      backgroundColor: AppColors.blueTextColor,
      leading: Obx(() => IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios,
              color: controller.isScrolledUp.value
                  ? Colors.black87
                  : Colors.white70))),
      title: Obx(
        () => CustomTextWidget(
            text: 'Steps ${controller.activePageIndex.value + 1} of 4',
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            textColor: controller.isScrolledUp.value
                ? Colors.black87
                : Colors.white70),
      ),
      centerTitle: true,
      actions: const [
        ProfileAvatar(),
      ],
    );
  }
}

class BottomPageViewSection extends StatelessWidget {
  const BottomPageViewSection({
    super.key,
    required this.controller,
  });

  final AddTaskController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SliverFillRemaining(
        hasScrollBody: false,
        fillOverscroll: true,
        child: IndexedStack(
          sizing: StackFit.expand,
          index: controller.activePageIndex.value,
          children: [
            CustomStepperBody1(),
            CustomStepperBody2(),
            CustomStepperBody3(),
            CustomStepperBody4(),
          ],
        ),
      ),
    );
  }
}
