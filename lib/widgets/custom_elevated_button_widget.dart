import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final Widget widget;
  final VoidCallback onPressed;
  final double verticalPadding;
  final double horizontalPadding;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final WidgetStateProperty<Color?>? backgroundColor;

  const CustomElevatedButtonWidget({
    required this.widget,
    required this.onPressed,
    this.verticalPadding = 16,
    this.horizontalPadding = 16,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
    this.borderRadius = 16,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: widget,
    );
  }
}
