import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/authentication/loginpage.dart';

class PaymentQris extends StatefulWidget {
  const PaymentQris({super.key});

  @override
  State<PaymentQris> createState() => _PaymentQrisState();
}

class _PaymentQrisState extends State<PaymentQris> {
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
              const SizedBox(height: 36)
            ],
          ),
          Padding(
            padding: CustomPadding.kSidePadding,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsetsDirectional.zero,
                      constraints:
                          const BoxConstraints(minHeight: 10, minWidth: 10),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      color: ColorsCollection.WhiteNeutral,
                      iconSize: 20,
                      splashRadius: 25,
                    ),
                    const SizedBox(width: 10),
                    Text('Payment', style: AppTextStyles.appbartitlewhite),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.75,
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
                        const SizedBox(height: 36),
                        Text('Scan Qris',
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
                            Text('Total Payment',
                                style: AppTextStyles.subtitleStyle),
                            Text('Rp.28.600',
                                style: AppTextStyles.titleStyleBlack),
                          ],
                        ),
                        const SizedBox(height: 36),
                        Image.asset("images/QRcode.png", width: 200),
                        const SizedBox(height: 20),
                        Text('Scan to Pay', style: AppTextStyles.priceProduct),
                        const SizedBox(height: 10),
                        Text('Can be used for all types of e-wallets',
                            style: AppTextStyles.subtitle3),
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
                        const SizedBox(height: 20)
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
