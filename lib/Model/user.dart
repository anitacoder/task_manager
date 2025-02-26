// models/user.dart
class User {
  final String email;
  final String password;

  User({required this.email, required this.password});

  // Convert a User into a Map.
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
