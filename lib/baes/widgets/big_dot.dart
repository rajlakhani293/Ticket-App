import 'package:flutter/material.dart';
import 'package:ticket_app/baes/res/styles/app_styles.dart';

class BigDot extends StatelessWidget {
  final bool? isColor;
  const BigDot({super.key, this.isColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: isColor == null ? Colors.white : AppStyles.dotColor,
        ),
        color: Colors.transparent,
      ),
    );
  }
}
