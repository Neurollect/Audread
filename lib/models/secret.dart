class Secret {
  final String supabaseUrl;
  final String supabaseAnonKey;
  Secret({
    this.supabaseUrl = "",
    this.supabaseAnonKey = "",
  });

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return Secret(
      supabaseUrl: jsonMap["supabase_url"],
      supabaseAnonKey: jsonMap["supabase_anon_key"],
    );
  }
}
