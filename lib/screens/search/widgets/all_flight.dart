import 'package:flutter/material.dart';

import '../../../baes/utils/all_json.dart';
import 'flight_suggestion_card.dart';

class AllFlight extends StatelessWidget {
  const AllFlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Flight'), centerTitle: true),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: flightSuggestions
                  .map((singleFlight) => FlightSuggestionCard(flight: singleFlight,))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
