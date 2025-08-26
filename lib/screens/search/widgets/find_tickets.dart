import 'package:flutter/material.dart';
import 'package:ticket_app/baes/res/styles/app_styles.dart';

class FindTickets extends StatelessWidget {
  final String text;
  const FindTickets({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppStyles.textStyle.copyWith(color: Colors.white),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppStyles.findTicketColor,
      ),
    );
  }
}
