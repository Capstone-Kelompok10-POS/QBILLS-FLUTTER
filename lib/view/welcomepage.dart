import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/authentication/loginpage.dart';
import 'package:pos_capstone/viewmodel/view_model_login.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewmodel = Provider.of<LoginVM>(context, listen: false);
    return Scaffold(
      backgroundColor: ColorsCollection.WhiteNeutral,
      body: Center(
        child: Padding(
          padding: CustomPadding.kSidePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("images/illus.svg"),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Find the best way",
                      style: AppTextStyles.titleStyleBrown),
                  const SizedBox(width: 4),
                  Text("to", style: AppTextStyles.titleStyle),
                ],
              ),
              Text("manage your business", style: AppTextStyles.titleStyle),
              const SizedBox(height: 18),
              Text(
                  "Enjoy a faster and more practical experience\nas a coffeeshop cashier.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subtitleStyle),
              const SizedBox(height: 48),
              CustomButton(
                text: "Get Started",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                  loginViewmodel.logindata.setBool("login", false);
                },
                buttonType: ButtonType.filled,
              )
            ],
          ),
        ),
      ),
    );
  }
}
