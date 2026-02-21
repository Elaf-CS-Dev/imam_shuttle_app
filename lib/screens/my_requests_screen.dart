import 'package:flutter/material.dart';
import '../models/trip_model.dart'; 

class MyRequestsScreen extends StatelessWidget {
  final Trip selectedTrip; 

  const MyRequestsScreen({super.key, required this.selectedTrip});

  String calculateTime(String destination) {
    if (destination.contains('5') || destination.contains('6')) {
      return '5 دقائق'; 
    } else if (destination.contains('7') || destination.contains('8')) {
      return '8 دقائق'; 
    } else {
      return '10 دقائق'; 
    }
  }

  @override
  Widget build(BuildContext context) {
    String duration = calculateTime(selectedTrip.destination);

    return Scaffold(
      appBar: AppBar(
        title: const Text("طلباتي", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF758E97), 
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl, 
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                color: Colors.green[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 30,
                  ),
                  title: Text(
                    "تم إضافة الرحلة إلى قسم طلباتي بنجاح",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(15),
                  leading: const Icon(
                    Icons.access_time_filled,
                    color: Colors.orange,
                    size: 35,
                  ),
                  title: Text(
                    "الوجهة: ${selectedTrip.destination}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "الوقت التقديري للوصول: $duration", 
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  trailing: const Chip(
                    label: Text(
                      "قيد الانتظار",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    backgroundColor: Color(0xFF758E97),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
