import 'dart:io';
import 'dart:math';

import '../lib/Instagram.dart';

List<Instagram> instagram = [];

void main() => interface();

void interface() {
  stdout.write("1.Ro'yhatdan o'tish \n2.Kirish \n3.Parolni tiklash \n");
  int? command = int.tryParse(stdin.readLineSync()!);

  switch (command) {
    case 1:
      {
        register();
        break;
      }
    case 2:
      {
        entrance();
        break;
      }
    case 3:
      {
        resetPassword();
        break;
      }
    default:
      {
        interface();
      }
  }
}

void register() {
  Random random = Random();
  int id = random.nextInt(1000);
  stdout.write("Ism familiyangizni kiriting -> ");
  String name = stdin.readLineSync()!;
  stdout.write("Username kiriting -> ");
  String username = stdin.readLineSync()!;
  stdout.write("Parol kiriting -> ");
  String password = stdin.readLineSync()!;
  stdout.write("Nomeringizni kiriting -> ");
  String phone = stdin.readLineSync()!;
  stdout.write("Tug'ulgan kuningizni kiriting -> ");
  String birthday = stdin.readLineSync()!;
  stdout.write("Pochtangizni kiriting -> ");
  String mail = stdin.readLineSync()!;
  bool check = true;
  for (var item in instagram) {
    if (item.username == username) {
      check = false;
    }
  }
  Instagram instagrams = Instagram(id,
      name: name,
      username: username,
      password: password,
      phone: phone,
      birthday: birthday,
      mail: mail,
  );
  if (check) {
    instagram.add(instagrams);
    print("Successfully add \n");
  } else {
    print("Bunday foydalanuvchi mavjud");
  }
  interface();
}

String usernameGlobal = "";
String user = "", phone = "";
var obj;

void entrance() {
  stdout.write("Username kiriting -> ");
  String username = stdin.readLineSync()!;
  stdout.write("Parol kiriting  -> ");
  String password = stdin.readLineSync()!;
  print("");
  bool check = false;
  for (var element in instagram) {
    if (element.username == username && element.password == password) {
      while (true) {
        user = element.name;
        phone = element.phone;
        obj = element;
        check = true;
        usernameGlobal = element.username;
        enter();
      }
    }
  }

  if (!check) {
    print("Login yoki parol xato ! \n");
    interface();
  }
}

void enter() {
  stdout.write(
      "1.Kelgan xabarlar \n2.Xabar yuborish  \n3.Malumotlar \n4.Akkauntdan chiqish \n");
  int? command = int.tryParse(stdin.readLineSync()!);
  switch (command) {
    case 1:
      {
        print(
            "${obj.inUsername ?? "Hech kim"} -> tomonidan '${obj.message ?? "hech nima "}' yozildi \n");
        break;
      }
    case 2:
      {
        sendMessage();
        break;
      }
    case 3:
      {
        print("Nomi -> $user :  Raqami -> $phone \n");
        break;
      }
    case 4:
      {
        interface();
        break;
      }
  }
}

void sendMessage() {
  stdout.write("Username kiriting -> ");
  String username = stdin.readLineSync()!;
  bool check = false;
  for (int i = 0; i < instagram.length; i++) {
    if (instagram[i].username == username) {
      check = true;
      stdout.write("Xabar yozing -> ");
      String message = stdin.readLineSync()!;
      instagram[i].message = message;
      instagram[i].inUsername = usernameGlobal;
      print("Xabar yuborildi ! \n");
    }
  }
  if (!check) {
    print("Bunday username yo'q \n");
  }
  enter();
}

void resetPassword() {
  stdout.write("Ismingizni kiriting -> ");
  String name = stdin.readLineSync()!;
  stdout.write("Tug'ulgan kuningizni kiriting -> ");
  String birthday = stdin.readLineSync()!;
  stdout.write("Pochtangizni kiriting -> ");
  String mail = stdin.readLineSync()!;

  bool check = false;
  for (var item in instagram) {
    if (item.name == name && item.birthday == birthday && item.mail == mail) {
      check = true;
      print("Username -> ${item.username} \nPassword -> ${item.password} \n");
    }
  }
  if (!check) {
    print("Noto'g'ri malumot kiritildi !!! \n");
  }
  interface();
}
