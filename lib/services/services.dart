import 'package:audread/services/storage/hive.dart';
import 'package:audread/services/supabase/supabase.dart';

class Services {
  final supabaseService = SupabaseService();
  final hiveStorageService = HiveStorage();
}
