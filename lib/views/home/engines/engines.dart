import 'package:energy_services/controllers/engines_controller.dart';
import 'package:energy_services/controllers/universal_controller.dart';
import 'package:energy_services/helper/appbar.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/helper/reusable_textfield.dart';
import 'package:energy_services/helper/validator.dart';
import 'package:energy_services/models/engine_model.dart';
import 'package:energy_services/views/home/add_task/widgets/heading&textfield.dart';
import 'package:energy_services/views/home/engines/engines_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EnginesScreen extends StatelessWidget {
  EnginesScreen({super.key});

  final EnginesController controller = Get.put(EnginesController());
  final UniversalController universalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/home-bg.png', fit: BoxFit.cover),
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                        floating: true,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        forceMaterialTransparency: true,
                        expandedHeight: context.height * 0.25,
                        flexibleSpace: ListView(children: [
                          Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(children: [
                                const ReUsableAppbar(title: 'Engines'),
                                ReUsableTextField(
                                  hintText: 'Search Records',
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
                  child: Obx(
                    () => ListView(
                      children: [
                        CustomButton(
                          buttonText: '+ Add Engine',
                          onTap: () => _openAddEngineDialog(
                              context: context, controller: controller),
                        ),
                        universalController.engines.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextWidget(
                                    text: 'No Engines Added',
                                    maxLines: 2,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: universalController.engines.length,
                                itemBuilder: (context, index) {
                                  final engine =
                                      universalController.engines[index];
                                  return CustomEngineCard(
                                    model: engine,
                                    onTap: () => Get.to(
                                        () => EngineDetailScreen(model: engine),
                                        transition: Transition.size),
                                  );
                                },
                              )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _openAddEngineDialog(
    {required BuildContext context, required EnginesController controller}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: Obx(
            () => AlertDialog(
              scrollable: true,
              backgroundColor: Colors.transparent,
              // title: CustomTextWidget(text: 'Hello'),
              content: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: context.height * 0.02),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(255, 220, 105, 0.4),
                      Color.fromRGBO(86, 127, 255, 0.4),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        spreadRadius: 5.0),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0)
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: context.height * 0.1,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/user2.jpg")),
                      ),
                    ),
                    Form(
                        key: controller.qrFormKey,
                        child: Column(
                          children: [
                            HeadingAndTextfield(
                              title: 'Enter Engine Name & Model',
                              fontSize: 12.0,
                              controller: controller.engineName,
                              validator: (val) =>
                                  AppValidator.validateEmptyText(
                                      fieldName: 'Engine Name & Model',
                                      value: val),
                            ),
                            HeadingAndTextfield(
                              title: 'Enter Subtitle',
                              fontSize: 12.0,
                              controller: controller.engineSubtitle,
                              validator: (val) =>
                                  AppValidator.validateEmptyText(
                                      fieldName: 'Engine Subtitle', value: val),
                            ),
                          ],
                        )),
                    CustomButton(
                      usePrimaryColor:
                          controller.isQrCodeGenerated.value == true,
                      buttonText: 'Save & Generate QR code ',
                      fontSize: 12.0,
                      onTap: () {
                        FormState? formState =
                            controller.qrFormKey.currentState as FormState?;
                        if (formState != null && formState.validate()) {
                          controller.generateQrCode();
                          Future.delayed(const Duration(seconds: 2), () {
                            Get.back();
                          });
                        }
                      },
                    ),
                    const Divider(color: Colors.black54),
                    controller.isQrCodeGenerated.value
                        ? Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54)),
                            child: QrImageView(
                              data: controller.engineName.text.trim(),
                              version: QrVersions.auto,
                              size: 200.0,
                              errorStateBuilder: (cxt, err) {
                                return Center(
                                  child: CustomTextWidget(
                                    text: 'Uh oh! Something went wrong...',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    fontSize: 12.0,
                                  ),
                                );
                              },
                            ),
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextWidget(
                                text:
                                    'Generate QR Code by filling the above fields.',
                                maxLines: 2,
                                fontSize: 12.0,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

class CustomEngineCard extends StatelessWidget {
  final EngineModel model;
  final VoidCallback onTap;

  const CustomEngineCard({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            model.image == ''
                ? 'https://img.freepik.com/premium-photo/3d-car-engine-hd-8k-wallpaper-stock-photographic-image_890746-42633.jpg?w=360'
                : model.image!,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        title: CustomTextWidget(
          text: model.name ?? 'No Image Specified',
          fontSize: 14.0,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: model.subtitle ?? 'No SubTitle Specified',
              fontSize: 14.0,
            ),
          ],
        ),
        // trailing: CustomTextWidget(
        //     text: 'Change',
        //     fontSize: 12.0,
        //     textColor: AppColors.blueTextColor),
      ),
    );
  }
}

class CustomReportCard extends StatelessWidget {
  const CustomReportCard({
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
                  text: 'Report ID: RP-2024001',
                  fontSize: 10.0,
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
            CustomTextWidget(
              text: 'Machine ID: MAC-12345',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            CustomTextWidget(
              text: 'Technician: John Doe',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
