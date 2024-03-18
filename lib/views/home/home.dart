import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:flutter/cupertino.dart';
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
          Image.asset('assets/images/home-bg.png', fit: BoxFit.cover),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Center(
                  child: Image.asset('assets/images/applogo-light.png',
                      height: context.height * 0.2, fit: BoxFit.cover),
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
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DashboardCard(
                              title: 'Start New Task',
                              subtitle:
                                  'Use this button to fill out the engine repair form',
                              image: 'assets/images/start-task.png',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SmallCard(
                                    title: 'Reports',
                                    icon: Symbols.lab_profile),
                                SmallCard(
                                    title: 'Customize Units',
                                    icon: Symbols.dashboard_customize),
                                SmallCard(
                                    title: 'Engines',
                                    icon: Symbols.manufacturing),
                              ],
                            ),
                            DashboardCard(
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
  const SmallCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReUsableContainer(
          color: AppColors.blueTextColor,
          child: Icon(icon, color: Colors.white, size: 40.0),
        ),
        const SizedBox(height: 6.0),
        CustomTextWidget(text: title, textColor: AppColors.blueTextColor)
      ],
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ReUsableContainer(
        color: AppColors.primaryColor,
        child: Row(
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
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                image,
                height: context.height * 0.15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
