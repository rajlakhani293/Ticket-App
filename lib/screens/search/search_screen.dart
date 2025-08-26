import 'package:flutter/material.dart';
import 'package:ticket_app/baes/res/media.dart';
import 'package:ticket_app/baes/res/styles/app_styles.dart';
import 'package:ticket_app/screens/search/widgets/app_text_icon.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/search/widgets/find_tickets.dart';
import 'package:ticket_app/screens/search/widgets/flight_suggestion_card.dart';

import '../../baes/widgets/app_double_text.dart';
import '../../domain/app_routes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> flightSuggestions = [
      {"from": "Mumbai", "to": "New Delhi", "note": "Cheapest Today"},
      {"from": "Bangalore", "to": "Goa", "note": "Lowest Fare Found"},
      {"from": "Hyderabad", "to": "Manali", "note": "Hot Deal for Weekend"},
      {"from": "Chennai", "to": "Kolkata", "note": "Book Now & Save"},
      {"from": "Pune", "to": "Jaipur", "note": "Fast Selling Route"},
      {"from": "Ahmedabad", "to": "Dubai", "note": "International Offer"},
      {"from": "Delhi", "to": "Singapore", "note": "Best Fare Alert"},
      {"from": "Kochi", "to": "Bangalore", "note": "Today’s Deal"},
      {"from": "Indore", "to": "Delhi", "note": "Under ₹2000"},
      {"from": "Lucknow", "to": "Mumbai", "note": "Top Choice"},
      {"from": "Varanasi", "to": "Hyderabad", "note": "Weekend Special"},
      {"from": "Nagpur", "to": "Chennai", "note": "Budget Friendly"},
      {"from": "Surat", "to": "Pune", "note": "Limited Time Offer"},
      {"from": "Patna", "to": "Kolkata", "note": "Grab the Deal"},
      {"from": "Raipur", "to": "Delhi", "note": "Students Save More"},
    ];


    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(height: 40),
          Text(
            'What are\n you looking for?',
            style: AppStyles.headLineStyle1.copyWith(fontSize: 35),
          ),
          SizedBox(height: 20),
          AppTicketTabs(
            firstTab: "All Tickets",
            secondTab: "Hotels",
          ),
          SizedBox(height: 20),
          AppTextIcon(icon: Icons.flight_takeoff_rounded, text: 'Departure'),
          SizedBox(height: 20),
          AppTextIcon(icon: Icons.flight_land_rounded, text: 'Arrival'),
          SizedBox(height: 20),
          FindTickets(text: 'Find Tickets'),
          SizedBox(height: 20),
          AppDoubleText(
            bigText: 'Upcoming Flights',
            smallText: 'View all',
            func: () => Navigator.pushNamed(context, AppRoutes.all_flight),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: flightSuggestions.map((singleFlight) {
                return FlightSuggestionCard(flight: singleFlight);
              }).toList(),
            ),
          ),



        ],
      ),
    );
  }
}
