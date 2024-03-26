import 'package:energy_services/controllers/universal_controller.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.location.request();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Energy Services',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(UniversalController());
      }),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
