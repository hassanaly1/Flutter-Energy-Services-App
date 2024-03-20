import 'package:energy_services/helper/appbar.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/profile_avatar.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/helper/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllTasksScreen extends StatelessWidget {
  const ViewAllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/home-bg.png', fit: BoxFit.cover),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                      // pinned: true, //stuck the view at the below AppBar
                      // floating: true, //stuck the view at the top of AppBar
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      forceMaterialTransparency: true,
                      expandedHeight: context.height * 0.25,
                      flexibleSpace: ListView(children: [
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(children: [
                              const ReUsableAppbar(title: 'All Tasks'),
                              SizedBox(height: context.height * 0.02),
                              ReUsableTextField(
                                hintText: 'Search Task',
                                suffixIcon: const Icon(Icons.search_sharp),
                              )
                            ]))
                      ]))
                ];
              },
              body: Container(
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
                        spreadRadius: 5.0),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0),
                  ],
                ),
                child: ListView(
                  children: [
                    Image.asset('assets/images/view-task.png',
                        height: context.height * 0.15),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) => const CustomTaskCard(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTaskCard extends StatelessWidget {
  const CustomTaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      color: Colors.white30,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: 'Location: Factory A, Unit XYZ',
                  fontSize: 10.0,
                  decoration: TextDecoration.underline,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextWidget(
                      text: 'Date: March 10, 2024',
                      fontSize: 10.0,
                    ),
                    CustomTextWidget(
                      text: 'Time: 09:30 AM',
                      fontSize: 10.0,
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/construction-worker.png',
                  height: 30.0,
                  color: AppColors.blueTextColor,
                ),
                const SizedBox(width: 4.0),
                CustomTextWidget(
                  text: 'Journeyman: John Smith',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            CustomTextWidget(
              text: 'Job Scope:',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            CustomTextWidget(
              text: 'Engine Tune-Up and Set Point Specifications',
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
