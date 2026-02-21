import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:imam_shuttle_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://bsmryuobfngqnrgrncgc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJzbXJ5dW9iZm5ncW5yZ3JuY2djIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzAyOTQ2MDcsImV4cCI6MjA4NTg3MDYwN30.ioDrWICBWgfKcSFO0iVmijKFtUCFetTIUmJOfzQr094',
  );

  runApp(const ImamShuttleApp());
}

class ImamShuttleApp extends StatelessWidget {
  const ImamShuttleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imam Shuttle',
      theme: ThemeData(
        primaryColor: const Color(0xFF758E97),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF758E97)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
