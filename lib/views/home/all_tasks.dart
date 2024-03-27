import 'package:energy_services/controllers/universal_controller.dart';
import 'package:energy_services/helper/appbar.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/helper/reusable_textfield.dart';
import 'package:energy_services/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllTasksScreen extends StatelessWidget {
  ViewAllTasksScreen({super.key});

  final UniversalController controller = Get.find();

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
                    controller.tasks.isEmpty
                        ? Center(
                            child: CustomTextWidget(
                            text: 'No Tasks Added',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.tasks.length,
                            itemBuilder: (context, index) => CustomTaskCard(
                              model: controller.tasks[index],
                            ),
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
  final TaskModel model;
  const CustomTaskCard({
    super.key,
    required this.model,
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
                Flexible(
                  child: CustomTextWidget(
                    text: model.location! == ""
                        ? 'Not Assigned'
                        : model.location!,
                    fontSize: 12.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextWidget(
                      text: model.selectedDate == null
                          ? 'Not Assigned'
                          : '${model.selectedDate?.day.toString().padLeft(2, '0')} : ${model.selectedDate?.month.toString().padLeft(2, '0')} : ${model.selectedDate?.year.toString().padLeft(2, '0')}',
                      fontSize: 10.0,
                    ),
                    CustomTextWidget(
                      text: model.selectedTime == null
                          ? 'Not Assigned'
                          : '${model.selectedTime?.format(context).padLeft(2, '0')}',
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
                Flexible(
                  child: CustomTextWidget(
                    text: model.nameOfJourneyMan!.isEmpty
                        ? 'Not Assigned'
                        : model.nameOfJourneyMan!,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            CustomTextWidget(
              text: 'Job Scope:',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            CustomTextWidget(
              text: model.jobScope!.isEmpty ? 'Not Assigned' : model.jobScope!,
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
