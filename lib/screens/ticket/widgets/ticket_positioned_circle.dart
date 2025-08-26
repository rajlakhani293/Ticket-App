import 'package:flutter/material.dart';

import '../../../baes/res/styles/app_styles.dart';

class TicketPositionedCircle extends StatelessWidget {
  final bool? pos;
  const TicketPositionedCircle({super.key, this.pos});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      left: pos == true ? 10 : null,
      right: pos == true ? null : 10,
      top: 248,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2,color: AppStyles.textColor),
        ),
        child: CircleAvatar(
          maxRadius: 4,
          backgroundColor: AppStyles.textColor,
        ),
      ),
    );
  }
}
