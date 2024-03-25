import 'package:energy_services/controllers/googlemap_controller.dart';
import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/profile_avatar.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/views/home/add_task/custom_stepperbody1.dart';
import 'package:energy_services/views/home/add_task/custom_stepperbody2.dart';
import 'package:energy_services/views/home/add_task/custom_stepperbody3.dart';
import 'package:energy_services/views/home/add_task/custom_stepperbody4.dart';
import 'package:energy_services/views/home/add_task/stepper_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTaskScreen extends StatelessWidget {
  NewTaskScreen({super.key});
  final MapController mapController = Get.put(MapController());
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
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              backgroundColor: Colors.white70,
              body: NestedScrollView(
                  controller: controller.scrollController,
                  // floatHeaderSlivers: true,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        expandedHeight: context.height * 0.3,
                        pinned: true,
                        floating: true,
                        primary: false,
                        // title: Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                        //   child: Obx(
                        //     () => CustomTextWidget(
                        //       text:
                        //           'Steps ${controller.activePageIndex.value + 1} of 4',
                        //       fontSize: 18.0,
                        //       fontWeight: FontWeight.w600,
                        //       textColor: controller.isScrolledUp.value
                        //           ? Colors.black87
                        //           : Colors.white70,
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ),
                        // ),
                        // toolbarHeight: 300,
                        excludeHeaderSemantics: true,
                        forceMaterialTransparency: false,

                        // bottom: PreferredSize(
                        //   preferredSize: const Size.fromHeight(100),
                        //   child: Container(
                        //     color: AppColors.blueTextColor,
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         IconButton(
                        //             onPressed: () => Get.back(),
                        //             icon: const Icon(
                        //               Icons.arrow_back,
                        //               color: Colors.white70,
                        //             )),
                        //         Padding(
                        //           padding:
                        //               const EdgeInsets.symmetric(vertical: 8.0),
                        //           child: Obx(
                        //             () => CustomTextWidget(
                        //               text:
                        //                   'Steps ${controller.activePageIndex.value + 1} of 4',
                        //               fontSize: 18.0,
                        //               fontWeight: FontWeight.w600,
                        //               textColor: controller.isScrolledUp.value
                        //                   ? Colors.black87
                        //                   : Colors.white70,
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ),
                        //         ),
                        //         const ProfileAvatar(),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        flexibleSpace: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                              color: AppColors.blueTextColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () => Get.back(),
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white70,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Obx(
                                      () => CustomTextWidget(
                                        text:
                                            'Steps ${controller.activePageIndex.value + 1} of 4',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        textColor: Colors.white70,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  const ProfileAvatar(),
                                ],
                              ),
                            ),
                            TopSection(controller: controller),
                          ],
                        ),
                      ),
                    ];
                  },
                  body: Container(
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
                    child: BottomPageViewSection(controller: controller),
                  )),
              floatingActionButton: FloatingActionButton(
                onPressed: () => controller.scrollUp(),
                backgroundColor: AppColors.primaryColor,
                mini: true,
                shape: const CircleBorder(),
                child: const Icon(Icons.arrow_upward_rounded),
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
    return Container(
      color: AppColors.blueTextColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            // height: context.height * 0.25,
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
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ReUsableContainer(
                    color: AppColors.primaryColor,
                    child: CustomTextWidget(
                      text: 'CAT 3600 SERVICE',
                      fontSize: 18.0,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                StepperHeader(controller: controller),
              ],
            ),
          ),
        ],
      ),
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
      () => Column(
        children: [
          Expanded(
            child: IndexedStack(
              sizing: StackFit.loose,
              index: controller.activePageIndex.value,
              children: [
                CustomStepperBody1(),
                CustomStepperBody2(),
                CustomStepperBody3(),
                CustomStepperBody4(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
