import 'package:flutter/material.dart';
import '../models/trip_model.dart';
import 'my_requests_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color brandColor = const Color(0xFF758E97);
  bool showFacilities = false;
  String? selectedFacility;

  Trip? _lastTrip;

  final List<String> facilities = [
    "المركز الطبي",
    "البهو",
    "الشؤون التعليمية-قسم الرجال",
    "منطقة اسكان الدكاترة",
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: _buildDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: brandColor),
      ),
      body: Center(
        child: SizedBox(
          width: screenWidth > 600 ? 450 : screenWidth,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "أهلاً ${widget.userName} ..",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "وين وجهتك اليوم ؟",
                    style: TextStyle(fontSize: 16, color: brandColor),
                  ),

                  const SizedBox(height: 35),

                  _buildRouteButton("من المترو للجامعة", "بوابه 5،6"),
                  _buildRouteButton("من المترو للجامعة", "بوابه 7،8"),
                  _buildRouteButton("من الجامعة للمترو", "بوابه 5،6"),
                  _buildRouteButton("من الجامعة للمترو", "بوابه 7،8"),

                  const SizedBox(height: 25),

                  GestureDetector(
                    onTap: () =>
                        setState(() => showFacilities = !showFacilities),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        "احد مرافق الجامعه الاخرى؟",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  if (showFacilities) _buildFacilityList(),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRouteButton(String title, String gate) {
    return GestureDetector(
      onTap: () {
        Trip trip = Trip(
          id: DateTime.now().toString(),
          destination: "$title - $gate",
          time: "الآن",
        );

        setState(() {
          _lastTrip = trip;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("تم إضافة الرحلة بنجاح", textAlign: TextAlign.center),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MyRequestsScreen(selectedTrip: trip),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: brandColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Text(
              "<$gate>",
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFacilityList() {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: brandColor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: facilities
                .map(
                  (f) => RadioListTile(
                    title: Text(f, style: TextStyle(color: brandColor)),
                    value: f,
                    groupValue: selectedFacility,
                    activeColor: brandColor,
                    onChanged: (val) =>
                        setState(() => selectedFacility = val as String),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            if (selectedFacility != null) {
              Trip facilityTrip = Trip(
                id: DateTime.now().toString(),
                destination: selectedFacility!,
                time: 'الآن',
              );

              setState(() => _lastTrip = facilityTrip);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MyRequestsScreen(selectedTrip: facilityTrip),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: brandColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            minimumSize: const Size(140, 45),
          ),
          child: const Text("تأكيد", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: brandColor,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const SizedBox(height: 70),
              _buildDrawerItem("طلباتي", Icons.shopping_bag_outlined, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MyRequestsScreen(
                      selectedTrip:
                          _lastTrip ??
                          Trip(
                            id: '0',
                            destination: 'لا يوجد طلب حالي',
                            time: '',
                          ),
                    ),
                  ),
                );
              }),
              _buildDrawerItem("الملف الشخصي", Icons.person_outline, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              }),
              _buildDrawerItem(
                "ابلاغ عن ازدحام",
                Icons.report_problem_outlined,
                () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("تم الإبلاغ بنجاح"),
                      backgroundColor: Colors.orange,
                    ),
                  );
                },
              ),
              const Spacer(),
              _buildDrawerItem("الاعدادات", Icons.settings_outlined, () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text("الاعدادات"),
                    content: Text(
                      "الإصدار 1.0 - صنع بواسطة إيلاف",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: onTap,
    );
  }
}
