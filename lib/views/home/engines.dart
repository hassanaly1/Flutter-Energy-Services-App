import 'package:energy_services/helper/appbar.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/profile_avatar.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/helper/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnginesScreen extends StatelessWidget {
  const EnginesScreen({super.key});

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
                      floating: true, //stuck the view at the top of AppBar
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      forceMaterialTransparency: true,
                      expandedHeight: context.height * 0.25,
                      flexibleSpace: ListView(children: [
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(children: [
                              const ReUsableAppbar(title: 'Engines'),
                              SizedBox(height: context.height * 0.02),
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
                child: ListView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) => const CustomEngineCard(),
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

class CustomEngineCard extends StatelessWidget {
  const CustomEngineCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            'https://img.freepik.com/premium-photo/3d-car-engine-hd-8k-wallpaper-stock-photographic-image_890746-42633.jpg?w=360',
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        title: CustomTextWidget(
          text: 'Detroit Diesel DD15 ',
          fontSize: 14.0,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: 'Diesel Engines',
              fontSize: 14.0,
            ),
            CustomTextWidget(
              text: '2007',
              fontSize: 12.0,
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
