class AuthResponse {
  final String apiKey;
  final int expires;

  AuthResponse(this.apiKey, this.expires);

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(json['api_key'], int.parse(json['expires']));
  }
}