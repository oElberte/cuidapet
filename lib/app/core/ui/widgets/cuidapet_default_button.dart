import 'package:flutter/material.dart';

import '../extensions/theme_extension.dart';

class CuidapetDefaultButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color? color;
  final Color labelColor;
  final double labelSize;
  final double padding;
  final double width;
  final double height;

  const CuidapetDefaultButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.borderRadius = 10,
    this.color,
    this.labelColor = Colors.white,
    this.labelSize = 20,
    this.padding = 10,
    this.width = double.infinity,
    this.height = 66,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: color ?? context.primaryColor,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: labelSize,
            color: labelColor,
          ),
        ),
      ),
    );
  }
}
