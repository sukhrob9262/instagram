import 'dart:math';

class Instagram {
  int id;
  String name;
  String username;
  String password;
  String birthday;
  String phone;
  String? mail;
   String? message;
  String? inUsername;
  Instagram(
    this.id, {
    required this.name,
    required this.username,
    required this.phone,
    required this.birthday,
    required this.password,
    this.mail,
  });
}
