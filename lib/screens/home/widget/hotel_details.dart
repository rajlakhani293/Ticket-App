import 'package:flutter/material.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> hotelFacilities = [
      {'icon': Icons.bed, 'label': '3 Rooms'},
      {'icon': Icons.pool, 'label': 'Pool'},
      {'icon': Icons.breakfast_dining, 'label': 'Breakfast'},
      {'icon': Icons.ac_unit, 'label': 'AC'},
      {'icon': Icons.local_laundry_service, 'label': 'Laundry'},
      {'icon': Icons.wifi, 'label': 'Wi-Fi'},
      {'icon': Icons.family_restroom, 'label': 'Family'},
      {'icon': Icons.local_parking, 'label': 'Parking'},
      {'icon': Icons.tv, 'label': 'TV'},
      {'icon': Icons.spa, 'label': 'Spa'},
      {'icon': Icons.fitness_center, 'label': 'Gym'},
      {'icon': Icons.restaurant, 'label': 'Restaurant'},
      {'icon': Icons.local_bar, 'label': 'Bar'},
      {'icon': Icons.pets, 'label': 'Pet Friendly'},
    ];

    final hotel =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hotel Image
                Stack(
                  children: [
                    Image.asset(
                      hotel['image'],
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 40,
                      left: 16,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Location
                      Text(
                        hotel['name'],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        hotel['location'],
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: hotelFacilities.map((facility) {
                            return Container(
                              margin: EdgeInsets.only(left: 6),
                              child: _iconCircle(
                                facility['icon'],
                                facility['label'],
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      SizedBox(height: 20),
                      Text(
                        "Overview",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        hotel['description'],
                        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                      ),

                      SizedBox(height: 24),

                      Text(
                        "Reviews (1,129)",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),

                      ...List.generate(5, (index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.person, color: Colors.grey[600]),
                          ),
                          title: Text("User ${index + 1}"),
                          subtitle: Text("Clean room · Friendly staff"),
                          trailing: Text("Nov ${index + 1}, 2024"),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ✅ Book Now Button
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "₹${hotel['price']}/night",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Book now action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: StadiumBorder(),
                    ),
                    child: Text("Book now"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconCircle(IconData icon, String label) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[100],
            child: Icon(icon, color: Colors.black87),
          ),
          SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
