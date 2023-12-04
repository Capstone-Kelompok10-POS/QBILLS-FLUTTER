// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pos_capstone/bottomnavigationbar/bottomnavbar.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textfield/textfield.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/authentication/viewmodel.dart';
import 'package:pos_capstone/view/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String responseText = '';

  Future<void> login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    try {
      var responseData = await APIService.login(username, password);
      setState(() {
        responseText = 'Login berhasil: $responseData';
      });

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavBar()),
      );
    } catch (error) {
      setState(() {
        responseText = '$error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      Form(
                        child: CustomTextField(
                          controller: usernameController,
                          hintText: "Username",
                          fieldType: CustomTextFieldType.withIcon,
                          prefixIcon: Icons.person,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Form(
                        child: CustomTextField(
                          obscureText: true,
                          controller: passwordController,
                          hintText: "Password",
                          fieldType: CustomTextFieldType.withIcon,
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: Icons.visibility,
                          isPassword: true,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        text: "Login",
                        onPressed: login,
                        buttonType: ButtonType.filled,
                      ),
                      const SizedBox(height: 20.0),
                      // Text(
                      //   responseText,
                      //   style: const TextStyle(fontSize: 16.0),
                      // ),
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
