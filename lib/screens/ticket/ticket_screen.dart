import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/baes/res/media.dart';
import 'package:ticket_app/baes/res/styles/app_styles.dart';
import 'package:ticket_app/baes/widgets/app_column_text_layout.dart';
import 'package:ticket_app/baes/widgets/app_layotbuilder_widget.dart';
import 'package:ticket_app/baes/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/ticket/widgets/ticket_positioned_circle.dart';

import '../../baes/utils/all_json.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {

  int ticketIndex = 0; // default to 0

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map && args.containsKey('index')) {
      ticketIndex = args['index'];
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(title: Text('Tickets'), centerTitle: true),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(left: 20, top: 10, right: 20),
            children: [
              AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
              SizedBox(height: 10),

              Container(
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                  wholeScreen: true,
                  isColor: true,
                ),
              ),
              SizedBox(height: 2),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: AppStyles.ticketColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: 'Raj Lakhani',
                          bottomText: 'Passenger',
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: 'M70214589',
                          bottomText: 'Passport',
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    AppLayotbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: '1258 9462 7854',
                          bottomText: 'E-ticket number',
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: 'RJLK25',
                          bottomText: 'Booking code',
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    AppLayotbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(AppMedia.visaCard, scale: 11),
                                Text(
                                  ' *** 2462',
                                  style: AppStyles.headLineStyle3,
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Payment Method',
                              style: AppStyles.headLineStyle4,
                            ),
                          ],
                        ),

                        AppColumnTextLayout(
                          topText: '₹ 15,000',
                          bottomText: 'Total Price',
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppStyles.ticketColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      height: 70,
                      data: 'https://www.youtube.com',
                      barcode: Barcode.code128(),
                      drawText: false,
                      color: AppStyles.textColor,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: TicketView(ticket: ticketList[ticketIndex], wholeScreen: true),
              ),
              SizedBox(height: 40),

            ],
          ),
          TicketPositionedCircle(pos: true),
          TicketPositionedCircle(pos: false),
        ],
      ),
    );
  }
}
