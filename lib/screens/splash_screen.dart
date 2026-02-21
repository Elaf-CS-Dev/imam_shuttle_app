// import 'package:flutter/material.dart';
// import 'package:imam_shuttle_app/screens/sign_up_screen.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   final Color brandColor = const Color(0xFF758E97);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Spacer(flex: 2),

//               Center(
//                 child: ClipOval(
//                   child: Image.asset(
//                     'assets/images/imam_logo.jpg',
//                     width: 280,
//                     height: 160,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 40),

//               Text(
//                 "Imam Shuttle",
//                 style: TextStyle(
//                   fontSize: 36,
//                   fontWeight: FontWeight.w600,
//                   color: brandColor,
//                   letterSpacing: 1.2,
//                 ),
//               ),

//               const SizedBox(height: 12),

//               Text(
//                 "النقل الترددي الخاص بطالبات الامام",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: brandColor.withOpacity(0.8),
//                   height: 1.5,
//                 ),
//               ),

//               const Spacer(flex: 3),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const SignUpScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: brandColor,
//                   minimumSize: const Size(double.infinity, 55),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: const Text(
//                   "سجلي الان",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:imam_shuttle_app/screens/sign_up_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  final Color brandColor = const Color(0xFF758E97);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              Center(
                // تم التغيير هنا من ClipOval إلى ClipRRect لعمل زوايا ناعمة
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25), // درجة نعومة الزوايا
                  child: Image.asset(
                    'assets/images/imam_logo.jpg',
                    width: 400, // جعلنا العرض والارتفاع متساويين ليكون مربعاً
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Text(
                "Imam Shuttle",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: brandColor,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "النقل الترددي الخاص بطالبات الامام",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: brandColor.withOpacity(0.8),
                  height: 1.5,
                ),
              ),

              const Spacer(flex: 3),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: brandColor,
                  minimumSize: const Size(double.infinity, 55),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "سجلي الان",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
