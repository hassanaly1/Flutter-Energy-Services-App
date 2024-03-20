import 'package:energy_services/views/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('ProfileScreen');
          Get.to(
            () => const ProfileScreen(),
            transition: Transition.size,
            duration: const Duration(milliseconds: 600),
          );
        },
        child: const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/user2.jpg'),
        ));
  }
}
