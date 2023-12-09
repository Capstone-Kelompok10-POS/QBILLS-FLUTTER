import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.WhiteNeutral,
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: ColorsCollection.WhiteNeutral,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: CustomPadding.kSidePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("Report", style: AppTextStyles.appbartitle),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Today',
                  hintStyle: AppTextStyles.hintTextSearch,
                  isDense: true,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: ColorsCollection.GreyNeutral),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: ColorsCollection.GreyNeutral),
                  ),
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 24,
                    color: ColorsCollection.GreyNeutral,
                  ),
                ),
                style: AppTextStyles.hintTextSearch,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: CustomPadding.kSidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "History transaction",
                style: AppTextStyles.titleProduct,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorsCollection.GreyNeutral02),
                        borderRadius: BorderRadius.circular(8),
                        color: ColorsCollection.WhiteNeutral,
                      ),
                      width: 50,
                      height: 50,
                      child: const Icon(Icons.remove_circle_outline,
                          color: ColorsCollection.ErrorColor),
                    ),
                    title: Text(
                      "Maren Vetrovs",
                      style: AppTextStyles.titleStyleBlack,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "14/11/2023, 11.58",
                          style: AppTextStyles.subtitleStyle,
                        ),
                        Text(
                          "Transfer Bank",
                          style: AppTextStyles.subtitleStyle,
                        ),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "+ Rp.50.000",
                          style: AppTextStyles.titleStyleBlack,
                        ),
                        Text(
                          "Cancel",
                          style: AppTextStyles.subtitleStyle,
                        ),
                      ],
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
