import 'package:energy_services/helper/appbar.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/views/home/add_task/add_task.dart';
import 'package:energy_services/views/home/all_tasks.dart';
import 'package:energy_services/views/home/engines/engines.dart';
import 'package:energy_services/views/home/reports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/home-bg.png', fit: BoxFit.fill),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: context.width * 0.01,
                    right: context.width * 0.01,
                    bottom: context.width * 0.05,
                  ),
                  child: Column(
                    children: [
                      ReUsableAppbar(
                        title: '',
                        showBackArrow: false,
                        prefixWidget: Image.asset(
                            'assets/images/app-logo-white.png',
                            height: context.height * 0.1,
                            fit: BoxFit.cover),
                      ),
                      CustomTextWidget(
                        text: 'Service reports made easy',
                        textColor: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: context.height * 0.02,
                        horizontal: context.width * 0.05),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(255, 220, 105, 0.4),
                            Color.fromRGBO(86, 127, 255, 0.4),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
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
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            'assets/images/gear.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DashboardCard(
                              onTap: () => Get.to(
                                () => AddTaskScreen(),
                                transition: Transition.size,
                              ),
                              title: 'Start New Task',
                              subtitle: 'Equipment Repair',
                              image: 'assets/images/start-task.png',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SmallCard(
                                  onTap: () => Get.to(
                                    () => const ReportsScreen(),
                                    transition: Transition.zoom,
                                  ),
                                  title: 'Reports',
                                  icon: Symbols.lab_profile,
                                ),
                                SmallCard(
                                  onTap: () {},
                                  title: 'Customize Units',
                                  icon: Symbols.dashboard_customize,
                                ),
                                SmallCard(
                                  onTap: () => Get.to(
                                    () => EnginesScreen(),
                                    transition: Transition.zoom,
                                  ),
                                  title: 'Engines',
                                  icon: Symbols.manufacturing,
                                ),
                              ],
                            ),
                            DashboardCard(
                              onTap: () => Get.to(
                                () => ViewAllTasksScreen(),
                                transition: Transition.size,
                              ),
                              title: 'View Tasks',
                              subtitle:
                                  'Click here to view all submitted repair forms and their details.',
                              image: 'assets/images/view-task.png',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const SmallCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: ReUsableContainer(
            padding: const EdgeInsets.all(12.0),
            color: AppColors.blueTextColor,
            child: Icon(icon, color: Colors.white, size: 40.0),
          ),
        ),
        CustomTextWidget(text: title, fontSize: 12.0)
      ],
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;
  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: onTap,
        child: ReUsableContainer(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: title,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomTextWidget(
                      text: subtitle,
                      maxLines: 3,
                      fontSize: 12.0,
                    )
                  ],
                ),
              ),
              Expanded(child: Image.asset(image, height: context.height * 0.18))
            ],
          ),
        ),
      ),
    );
  }
}
