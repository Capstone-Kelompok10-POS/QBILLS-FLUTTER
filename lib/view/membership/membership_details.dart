import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

class MemberDetailsPage extends StatelessWidget {
  final String name;
  final int totalPoint;

  const MemberDetailsPage(
      {Key? key, required this.name, required this.totalPoint})
      : super(key: key);
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
              totalPoint.toString(),
              style: AppTextStyles.titleStyleBlack1,
            ),
            Text(
              "Member Point",
              style: AppTextStyles.subtitleStyle,
            ),
            const SizedBox(height: 12),
            Stack(
              children: [
                Image.asset(
                  "images/cardmembership.png",
                  width: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 10,
                  bottom: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          name,
                          style: AppTextStyles.cardNameTittle,
                          maxLines: 2, // Jumlah maksimal baris
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
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
