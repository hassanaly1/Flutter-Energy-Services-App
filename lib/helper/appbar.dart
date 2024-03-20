import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReUsableAppbar extends StatelessWidget {
  final String title;
  final Color? iconColor;
  final bool showBackArrow;
  const ReUsableAppbar({
    super.key,
    required this.title,
    this.showBackArrow = true,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => showBackArrow ? Get.back() : null,
              icon: Icon(Icons.arrow_back_ios,
                  color: showBackArrow ? iconColor : Colors.transparent)),
          CustomTextWidget(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            textColor: Colors.white,
          ),
          const ProfileAvatar()
        ],
      ),
    );
  }
}
