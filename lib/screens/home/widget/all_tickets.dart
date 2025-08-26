import 'package:flutter/material.dart';
import 'package:ticket_app/baes/utils/all_json.dart';
import 'package:ticket_app/baes/widgets/ticket_view.dart';
import 'package:ticket_app/domain/app_routes.dart';

import '../../../baes/res/styles/app_styles.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Tickets'),
        centerTitle: true,
        elevation: 2,
        backgroundColor: AppStyles.bgColor,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: ticketList
                  .map(
                    (singleTicket) => GestureDetector(
                      onTap: () {
                        var index = ticketList.indexOf(singleTicket);
                        Navigator.pushNamed(
                          context,
                          AppRoutes.ticket_screen,
                          arguments: {"index": index},
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: TicketView(
                          ticket: singleTicket,
                          wholeScreen: true,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
