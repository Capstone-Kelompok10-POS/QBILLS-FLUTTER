import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/authentication/loginpage.dart';
import 'package:pos_capstone/view/homepage.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/view_model_convertpointmember.dart';
import '../../viewmodel/view_model_product.dart';

class ReceiptSuccess extends StatefulWidget {
  const ReceiptSuccess({super.key});

  @override
  State<ReceiptSuccess> createState() => _ReceiptSuccessState();
}

class _ReceiptSuccessState extends State<ReceiptSuccess> {
  double totalPrice = 0;
  double totalAll = 0;
  late ViewModelConvertPointMember pointProvider;

  @override
  Widget build(BuildContext context) {
    pointProvider =
        Provider.of<ViewModelConvertPointMember>(context, listen: false);
    pointProvider.getConvertPointMembers();
    return Scaffold(
      backgroundColor: ColorsCollection.WhiteNeutral,
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          totalPrice = value.calculateTotalPrice(value.cartItems);
          return Stack(
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
                  Padding(
                    padding: CustomPadding.kSidePadding,
                    child: CustomButton(
                      iconData: Icons.shopping_cart,
                      text: "Done",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      buttonType: ButtonType.filled,
                    ),
                  ),
                  const SizedBox(height: 24),
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
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Consumer<ViewModelConvertPointMember>(
                builder: (context, value, _) {
                  int totalDiscount =
                      value.getValuePoint(pointProvider.selectedValue);
                  double totalAll =
                      (totalPrice - totalDiscount) + (totalPrice * 0.10);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 100),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.74,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: ColorsCollection.WhiteNeutral,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              Image.asset("images/paysuccess.png"),
                              const SizedBox(height: 10),
                              Text('Thank You!',
                                  style: AppTextStyles.titleStyleBlack1),
                              const SizedBox(height: 8),
                              Text('Your transaction was successful!',
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
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Invoice',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 12,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'FRMPY127632765717',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 12,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              // cashier
                              const SizedBox(height: 5),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cashier',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 12,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Victor Yoga',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 12,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              // deliver to
                              const SizedBox(height: 8),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Deliver to',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 12,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Erin Stanto',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 12,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              // date
                              const SizedBox(height: 8),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 12,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '17 Desember 2023',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 12,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Item',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Amount',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Normal',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 10,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Cappucino Espresso',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Color(0xFF4C4C4C),
                                    fontSize: 13,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              // jumlah dan harga
                              const SizedBox(height: 5),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '1 x 26.000',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 13,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '26.000',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 13,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              // note
                              const SizedBox(height: 8),
                              const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Note',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Color(0xFF191919),
                                    fontSize: 10,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              // main note
                              const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'His coffee wants a little sugar with added cream',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 12,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              // payment method
                              const SizedBox(height: 14),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Payment Method',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 13,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Transfer',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 13,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              // Discount
                              const SizedBox(height: 3),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Discount',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 13,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Rp. $totalDiscount',
                                    style: const TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 13,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              // Tax / pajak
                              const SizedBox(height: 3),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'TAX',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 13,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Rp. ${(totalPrice * 0.10)}',
                                    style: const TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 13,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              // remaining points
                              const SizedBox(height: 15),
                              const SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Remaining points',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 12,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '2400',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 12,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // total payment
                              const SizedBox(height: 3),
                              const Divider(),
                              const SizedBox(height: 3),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total Payment',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF191919),
                                    ),
                                  ),
                                  Text(
                                    'Rp. $totalAll',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.file_download_outlined,
                                      color: Color(0xFF999999)),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Download Receipt',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 12,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
