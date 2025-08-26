import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/baes/res/media.dart';
import 'package:ticket_app/baes/res/styles/app_styles.dart';
import 'package:ticket_app/baes/utils/all_json.dart';
import 'package:ticket_app/baes/widgets/app_double_text.dart';
import 'package:ticket_app/baes/widgets/ticket_view.dart';
import 'package:ticket_app/domain/app_routes.dart';
import 'package:ticket_app/screens/hotel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.only(left: 18, top: 5, right: 18),
        children: [
          SizedBox(height: 42),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Good Morning', style: AppStyles.headLineStyle3),
                        SizedBox(height: 5),
                        Text('Book Tickets', style: AppStyles.headLineStyle1),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(AppMedia.logo),
                        ),
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 8),
                      Text('Search', style: AppStyles.headLineStyle3),
                    ],
                  ),
                ),
              ],
            ),
          ),


          SizedBox(height: 23),
          AppDoubleText(
            bigText: 'Upcoming Flights',
            smallText: 'View all',
            func: () => Navigator.pushNamed(context, AppRoutes.all_tickets),
          ),
          SizedBox(height: 17),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ticketList.map((singleTicket) {
                return TicketView(ticket: singleTicket, wholeScreen: false);
              }).toList(),
            ),
          ),


          SizedBox(height: 23),
          AppDoubleText(
            bigText: 'Hotels',
            smallText: 'View all',
            func: () => Navigator.pushNamed(context, AppRoutes.all_hotel),
          ),
          SizedBox(height: 17),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: hotelList.map((singleHotel) {
                return Hotel(hotel: singleHotel,wholeScreen: false);
              }).toList(),
            ),
          ),



        ],
      ),
    );
  }
}
