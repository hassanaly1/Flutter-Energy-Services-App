import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appbar.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/views/home/new_task/stepper_body.dart';
import 'package:energy_services/views/home/new_task/stepper_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTaskScreenDemo extends StatelessWidget {
  NewTaskScreenDemo({super.key});
  final AddTaskController controller = Get.put(AddTaskController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          Container(
            height: context.height * 0.5,
            color: Colors.green,
          )
        ],
      )
          // SliverAppBar(
          //   stretch: false,
          //   pinned: false,
          //   floating: false,
          //   automaticallyImplyLeading: false,
          //   backgroundColor: Colors.red,
          //   forceMaterialTransparency: false,
          //   bottom: PreferredSize(
          //     preferredSize: Size.fromHeight(context.height * 0.3),
          //     child: StepperHeader(controller: controller),
          //   ),
          //   flexibleSpace:
          //       ListView(physics: NeverScrollableScrollPhysics(), children: [
          //     const ReUsableAppbar(title: '', iconColor: Colors.black87),
          //     Container(
          //       height: context.height * 0.5,
          //       color: Colors.green,
          //     )
          //   ]),
          // ),

          ),
    );
  }
}

class NewTaskScreen extends StatelessWidget {
  NewTaskScreen({super.key});
  final AddTaskController controller = Get.put(AddTaskController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(255, 220, 105, 0.4),
                      Color.fromRGBO(86, 127, 255, 0.4)
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        spreadRadius: 5.0),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0),
                  ]),
              child: Column(
                children: [
                  ReUsableAppbar(title: '', iconColor: Colors.black87),
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
                  StepperBody(controller: controller),
                ],
              ))),
    );
  }
}
