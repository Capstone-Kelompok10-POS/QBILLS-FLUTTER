import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/viewmodel/view_model_login.dart';
import 'package:provider/provider.dart';

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  late LoginVM loginViewmodel;

  @override
  void initState() {
    super.initState();
    loginViewmodel = Provider.of<LoginVM>(context, listen: false);
    loginViewmodel.newLogin(context);
    loginViewmodel.currentLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsCollection.WhiteNeutral,
    );
  }
}
