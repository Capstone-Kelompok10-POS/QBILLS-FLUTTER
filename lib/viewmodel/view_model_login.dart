// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:pos_capstone/models/login_model.dart';
import 'package:pos_capstone/service/login_service.dart';
import 'package:pos_capstone/view/authentication/loginpage.dart';
import 'package:pos_capstone/view/homepage.dart';
import 'package:pos_capstone/view/welcomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginVM with ChangeNotifier {
  late GlobalKey<FormState> formkeylogin;
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  LoginModel? dataLogin;
  bool rememberMe = false;
  final service = loginService();
  late SharedPreferences logindata;
  late bool newUser;
  late bool currentUser;
  String usernameSharedPreference = "";
  String accessTokenSharedPreference = "";
  bool isSudahLogin = false;

  LoginVM() {
    checkSharedPreferences();
  }

  // Future<void> Login() async {
  //   final usernameUser = username.text;
  //   final passwordUser = password.text;
  //   final data = await service.loginAccount(usernameUser, passwordUser);
  //   dataLogin = data;
  //   usernameSharedPreference = dataLogin!.results.username;
  //   accessTokenSharedPreference = dataLogin!.results.token;
  //   print("ini adalah fungsi login");
  //   print(usernameSharedPreference);
  //   print(accessTokenSharedPreference);
  //   notifyListeners();
  // }

  Future<void> saveDataSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", usernameSharedPreference);
    await prefs.setString("access_token", accessTokenSharedPreference);
    username.clear();
    password.clear();
    notifyListeners();
  }

  Future<void> checkSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('username');
    final storedAccessToken = prefs.getString("access_token");
    usernameSharedPreference = storedUsername!;
    accessTokenSharedPreference = storedAccessToken!;
    print(usernameSharedPreference);
    print(accessTokenSharedPreference);
    // notifyListeners();
  }

  Future<void> buttonLogin(context) async {
    print("ini adalah button login");
    if (formkeylogin.currentState!.validate()) {
      if (username.text.isEmpty || password.text.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Gagal Login'),
              content: const Text('Mohon isi semua kolom.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Tutup'),
                ),
              ],
            );
          },
        );
      }
      final data = await service.loginAccount(username.text, password.text);
      dataLogin = data;
      if (data != null) {
        usernameSharedPreference = dataLogin!.results.username;
        accessTokenSharedPreference = dataLogin!.results.token;
        print("ini adalah fungsi login");
        print(usernameSharedPreference);
        print(accessTokenSharedPreference);
        logindata.setString("username", usernameSharedPreference);
        logindata.setString("access_token", accessTokenSharedPreference);
        logindata.setBool('loginCurrent', false);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Gagal Login'),
              content: const Text('Username atau password salah.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Tutup'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void newLogin(BuildContext context) async {
    print("ini adalah newlogin");
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool("login") ?? true;
    if (newUser == false) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WelcomePage()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false);
    }
  }

  void currentLogin(BuildContext context) async {
    logindata = await SharedPreferences.getInstance();
    currentUser = logindata.getBool("loginCurrent") ?? true;
    if (currentUser == false) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false);
    }
  }
}
