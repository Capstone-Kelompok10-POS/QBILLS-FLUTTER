// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textfield/textfield.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/homepage.dart';
import 'package:pos_capstone/viewmodel/view_model_login.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginVM viewmodel;

  @override
  void initState() {
    viewmodel = Provider.of<LoginVM>(context, listen: false);
    viewmodel.formkeylogin = GlobalKey<FormState>();
    super.initState();
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
                  child: Form(
                    key: viewmodel.formkeylogin,
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
                          controller: viewmodel.username,
                          hintText: "Username",
                          fieldType: CustomTextFieldType.withIcon,
                          prefixIcon: Icons.person,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          obscureText: true,
                          controller: viewmodel.password,
                          hintText: "Password",
                          fieldType: CustomTextFieldType.withIcon,
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: Icons.visibility,
                          isPassword: true,
                        ),
                        const SizedBox(height: 40),
                        CustomButton(
                          text: "Login",
                          onPressed: () => viewmodel.buttonLogin(context),
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
                ),
              ],
            )
          ],
        ));
  }
}
