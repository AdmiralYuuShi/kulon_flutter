import 'package:flutter/material.dart';

enum WidgetStandardSize { xs, s, m, l, xl }

class ButtonIconWidget extends StatelessWidget {
  final GestureTapCallback? onTap;
  final WidgetStandardSize size;
  final Color? color;
  final Color? iconColor;
  final IconData icon;

  const ButtonIconWidget({
    super.key,
    required this.icon,
    this.onTap,
    this.size = WidgetStandardSize.m,
    this.color,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    double btnSize = switch (size) {
      WidgetStandardSize.xs => 30,
      WidgetStandardSize.s => 40,
      WidgetStandardSize.m => 50,
      WidgetStandardSize.l => 60,
      WidgetStandardSize.xl => 70,
    };
    double iconSize = switch (size) {
      WidgetStandardSize.xs => 16,
      WidgetStandardSize.s => 20,
      WidgetStandardSize.m => 24,
      WidgetStandardSize.l => 28,
      WidgetStandardSize.xl => 32,
    };

    return InkWell(
      onTap: onTap,
      child: Container(
        width: btnSize,
        height: btnSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: color ?? Colors.grey,
        ),
        child: Icon(
          icon,
          color: iconColor ?? Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}
