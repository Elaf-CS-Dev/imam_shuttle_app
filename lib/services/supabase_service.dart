import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final _supabase = Supabase.instance.client;

  User? getCurrentUser() {
    return _supabase.auth.currentUser;
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
