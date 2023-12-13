import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/authentication/loginpage.dart';

class ReceiptSuccess extends StatefulWidget {
  const ReceiptSuccess({super.key});

  @override
  State<ReceiptSuccess> createState() => _ReceiptSuccessState();
}

class _ReceiptSuccessState extends State<ReceiptSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.WhiteNeutral,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Container(
                height: 340,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: ColorsCollection.Brown),
              ),
              const Spacer(),
              Text(
                'Once your payment is confirmed, we will immediately\nsend you a receipt.',
                style: AppTextStyles.subtitle3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12)
            ],
          ),
          Padding(
            padding: CustomPadding.kSidePadding,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  height: MediaQuery.of(context).size.height * 0.82,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    color: ColorsCollection.WhiteNeutral,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Image.asset("images/payprocess.png"),
                        const SizedBox(height: 10),
                        Text('Transfer Process',
                            style: AppTextStyles.titleStyleBlack1),
                        const SizedBox(height: 8),
                        Text(
                            'Complete the payment according to the terms as soon as possible.',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.subtitleStyle),
                        const SizedBox(height: 30),
                        const DottedLine(
                          lineLength: double.infinity,
                          direction: Axis.horizontal,
                          lineThickness: .2,
                          dashLength: 15.0,
                          dashColor: ColorsCollection.GreyNeutral,
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Please transfer to",
                                    style: AppTextStyles.subtitle3,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "PT.Qbills.biz",
                                    style: AppTextStyles.subtitleStyleBlack,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "images/Bca.png",
                                    width: 50,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "798 723 7797",
                                    style: AppTextStyles.titleProduct,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Payment',
                                style: AppTextStyles.subtitleStyle),
                            Text('Rp.28.600',
                                style: AppTextStyles.titleStyleBlack),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: ColorsCollection.GreyNeutral02,
                          thickness: 1,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Item', style: AppTextStyles.title2),
                            Text('Amount', style: AppTextStyles.title2),
                          ],
                        ),
                        const Divider(
                          color: ColorsCollection.GreyNeutral02,
                          thickness: 1,
                        ),
                        const SizedBox(height: 10),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text("Cuppucino Espresso")),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('1 x 26.000',
                                style: AppTextStyles.subtitleStyle),
                            Text('26.000', style: AppTextStyles.subtitleStyle),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Payment Method',
                                style: AppTextStyles.subtitleStyle),
                            Text('Transfer',
                                style: AppTextStyles.subtitleStyle),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Discount',
                                style: AppTextStyles.subtitleStyle),
                            Text('Rp.0', style: AppTextStyles.subtitleStyle),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tax', style: AppTextStyles.subtitleStyle),
                            Text('Rp.1.599',
                                style: AppTextStyles.subtitleStyle),
                          ],
                        ),
                        const Spacer(),
                        CustomButton(
                          iconData: Icons.shopping_cart,
                          text: "Already Paid",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          buttonType: ButtonType.filled,
                        ),
                        const SizedBox(height: 16),
                        InkWell(
                          child: Text('Cancel payment',
                              style: AppTextStyles.errorsubtitle),
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}