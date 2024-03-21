import 'package:energy_services/helper/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReUsableContainer extends StatelessWidget {
  final Widget child;
  EdgeInsetsGeometry? padding;
  double? verticalPadding;
  double? borderRadius;
  final bool showBackgroundShadow;
  final Color? color;
  double? height;

  ReUsableContainer({
    super.key,
    required this.child,
    this.padding,
    this.verticalPadding,
    this.height,
    this.borderRadius,
    this.showBackgroundShadow = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? context.height * 0.015, horizontal: 4.0),
      child: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Container(
      height: height,
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
        border: Border.all(
            color: showBackgroundShadow
                ? Colors.transparent
                : AppColors.lightGreyColor),
        boxShadow: showBackgroundShadow
            ? [
                const BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
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
