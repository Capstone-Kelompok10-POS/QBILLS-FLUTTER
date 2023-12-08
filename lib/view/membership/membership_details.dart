import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

class MemberDetailsPage extends StatelessWidget {
  const MemberDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.WhiteNeutral,
      appBar: AppBar(
        title: Text(
          'Member Details',
          style: AppTextStyles.appbartitle,
        ),
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorsCollection.BlackNeutral,
            )),
        backgroundColor: ColorsCollection.WhiteNeutral,
      ),
      body: Padding(
        padding: CustomPadding.kSidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "210",
              style: AppTextStyles.titleStyleBlack1,
            ),
            Text(
              "Member Point",
              style: AppTextStyles.subtitleStyle,
            ),
            SizedBox(
              width: 500,
              child: Image.asset("images/membercard.png"),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "History",
                style: AppTextStyles.titleProduct,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.arrow_downward,
                          color: ColorsCollection.SuccessColor),
                    ),
                    title: Text(
                      "Maren Vetrovs",
                      style: AppTextStyles.titleStyleBlack,
                    ),
                    subtitle: Text(
                      "14/11/2023, 11.58",
                      style: AppTextStyles.subtitleStyle,
                    ),
                    trailing: Text(
                      "+ 100",
                      style: AppTextStyles.titleStyleBlack,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
