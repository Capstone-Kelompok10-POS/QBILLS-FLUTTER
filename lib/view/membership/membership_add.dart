// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/textfield/textfield.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/viewmodel/view_model_add_membership.dart';
import 'package:pos_capstone/viewmodel/view_model_product.dart';
import 'package:provider/provider.dart';

class MembershipScreen extends StatefulWidget {
  MembershipScreen({Key? key}) : super(key: key);

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final MembershipViewModel membershipService = MembershipViewModel();

  late ProductProvider productProvider;

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.WhiteNeutral,
      appBar: AppBar(
        backgroundColor: ColorsCollection.WhiteNeutral,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Membership", style: AppTextStyles.titleStyleBrown),
            const SizedBox(height: 8.0),
            Text(
              "Build better relationships with customers by making them part of us",
              style: AppTextStyles.subtitleStyle,
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              controller: nameController,
              hintText: "Name",
              fieldType: CustomTextFieldType.withIcon,
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              hintText: "Phone",
              fieldType: CustomTextFieldType.withIcon,
              prefixIcon: Icons.phone,
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: CustomButton(
                    text: "Add",
                    onPressed: () {
                      if (!membershipService.isAdding) {
                        membershipService.addMembershipp(
                          nameController.text,
                          phoneController.text,
                        );
                        productProvider.indexPage1(context, 2);
                      }
                    },
                    buttonType: ButtonType.filled,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
