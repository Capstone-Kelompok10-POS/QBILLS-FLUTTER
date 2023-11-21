// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pos_capstone/bottomnavigationbar/bottomnavbar.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textfield/textfield.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _UserController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: CustomPadding.kSidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Center(
              child: Image.asset(
                "images/logo.png",
                width: 180,
              ),
            ),
            const SizedBox(height: 30),
            Text("Welcome back", style: AppTextStyles.titleStyle),
            Text("Sign in to continue", style: AppTextStyles.subtitleStyle),
            const SizedBox(height: 30),
            CustomTextField(
                prefixIcon: Icons.person,
                hintText: "Username",
                controller: _UserController,
                textFieldType: TextFieldType.outlined),
            const SizedBox(height: 16),
            CustomTextField(
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility,
              hintText: "Password",
              controller: _PasswordController,
              textFieldType: TextFieldType.outlined,
              onVisibilityToggle: (bool isHidden) {},
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: "Login",
              onPressed: () {
                Navigator.push(
                  context,
                  // DetailPage adalah halaman yang dituju
                  MaterialPageRoute(builder: (context) => const BottomNavBar()),
                );
              },
              buttonType: ButtonType.filled,
            )
          ],
        ),
      ),
    );
  }
}
