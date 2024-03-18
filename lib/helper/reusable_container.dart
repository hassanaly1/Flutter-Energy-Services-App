import 'package:energy_services/helper/appcolors.dart';
import 'package:flutter/material.dart';

class ReUsableContainer extends StatelessWidget {
  final Widget child;
  final bool showBackgroundShadow;
  final Color? color;
  double? height;

  ReUsableContainer({
    super.key,
    required this.child,
    this.height,
    this.showBackgroundShadow = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
      child: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
            color: showBackgroundShadow
                ? Colors.transparent
                : AppColors.lightGreyColor),
        boxShadow: showBackgroundShadow
            ? [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
