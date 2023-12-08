// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textfield/textfield.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/authentication/service/services.dart';
import 'package:pos_capstone/view/homepage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: ColorsCollection.WhiteNeutral,
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.asset("images/Backlogo.png"),
            Column(
              children: [
                Padding(
                  padding: CustomPadding.kSidePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80),
                      Center(
                        child: Image.asset(
                          "images/brownlogo.png",
                          width: 180,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text("Welcome back", style: AppTextStyles.titleStyle),
                      Text("Sign in to continue",
                          style: AppTextStyles.subtitleStyle),
                      const SizedBox(height: 30),
                      CustomTextField(
                        controller: usernameController,
                        hintText: "Username",
                        fieldType: CustomTextFieldType.withIcon,
                        prefixIcon: Icons.person,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        obscureText: true,
                        controller: passwordController,
                        hintText: "Password",
                        fieldType: CustomTextFieldType.withIcon,
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: Icons.visibility,
                        isPassword: true,
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        text: "Login",
                        onPressed: () async {
                          final username = usernameController.text;
                          final password = passwordController.text;
                          final user =
                              await authProvider.login(username, password);
                          if (user != null) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Login Gagal'),
                                  content: const Text(
                                      'Username atau password tidak valid.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        buttonType: ButtonType.filled,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Forgot Password",
                            style: AppTextStyles.subtitleStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
