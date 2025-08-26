import 'package:flutter/cupertino.dart';
import 'package:ticket_app/baes/bottom_nav_bar.dart';
import 'package:ticket_app/screens/home/widget/all_hotels.dart';
import 'package:ticket_app/screens/home/widget/all_tickets.dart';
import 'package:ticket_app/screens/home/widget/hotel_details.dart';
import 'package:ticket_app/screens/search/widgets/all_flight.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';

class AppRoutes {
  static const String bottom_nav = "/";
  static const String all_tickets = "/all_tickets";
  static const String all_hotel = "/all_hotel";
  static const String all_flight = "/all_flight";
  static const String ticket_screen = "/ticket_screen";
  static const String hotel_details = "/hotel_details";


  static Map<String, Widget Function(BuildContext)> getRoutes()=>{
    bottom_nav : (context)=> BottomNavBar(),
    all_tickets : (context)=> AllTickets(),
    all_hotel : (context)=> AllHotels(),
    all_flight : (context)=> AllFlight(),
    ticket_screen : (context)=> TicketScreen(),
    hotel_details : (context)=> HotelDetails(),


  };

}