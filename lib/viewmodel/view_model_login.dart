// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

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
  bool heightContainer = false;
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

  Future<void> Login() async {
    final usernameUser = username.text;
    final passwordUser = password.text;
    final data = await service.loginAccount(usernameUser, passwordUser);
    dataLogin = data;
    usernameSharedPreference = dataLogin!.results.username;
    accessTokenSharedPreference = dataLogin!.results.token;
  }

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
    notifyListeners();
  }

  Future<void> buttonLogin(context) async {
    if (formkeylogin.currentState!.validate()) {
      final data = await service.loginAccount(username.text, password.text);
      logindata.setBool('loginCurrent', false);
      if (data != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }
    }
  }

  void newLogin(BuildContext context) async {
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool("login") ?? true;
    if (newUser == false) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WelcomePage()),
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
