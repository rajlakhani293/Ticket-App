import 'package:flutter/material.dart';
import 'package:ticket_app/baes/res/styles/app_styles.dart';
import 'package:ticket_app/domain/app_routes.dart';
import 'package:ticket_app/screens/hotel.dart';

import '../../../baes/utils/all_json.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Hotels'),
        centerTitle: true,
        elevation: 2,
        backgroundColor: AppStyles.bgColor,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: hotelList
                  .map(
                    (singleHotel) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.hotel_details,
                          arguments: singleHotel,
                        );
                      },

                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Hotel(hotel: singleHotel, wholeScreen: true),
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
