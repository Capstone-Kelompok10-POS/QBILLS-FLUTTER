import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorsCollection.WhiteNeutral,
        appBar: AppBar(
          title: Text(
            'Cart Item',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: CustomPadding.kSidePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Search membership', style: AppTextStyles.titleProduct),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        hintText: "Phone Number",
                        hintStyle: AppTextStyles.hintstyletext,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 1,
                            color: ColorsCollection.GreyNeutral02,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: ColorsCollection.GreyNeutral02,
                          ),
                        ),
                        suffixIcon: SizedBox(
                          width: 100,
                          child: CustomButton(
                              buttonType: ButtonType.filled,
                              text: "Search",
                              onPressed: () {}),
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 70,
                        width: 50,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("images/kopi1.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Normal",
                                style: AppTextStyles.subtitle2,
                              ),
                              const Icon(Icons.close, size: 20),
                            ],
                          ),
                          Text(
                            "Cappucino Espresso",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.titleProduct,
                          ),
                          const SizedBox(height: 4),
                          Text("Rp.23.000",
                              style: AppTextStyles.subtitleStyleBlack),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                  height: 30,
                                  width: 90,
                                  iconData: Icons.edit_outlined,
                                  buttonType: ButtonType.outlineWithIcon,
                                  text: "edit",
                                  onPressed: () {}),
                              SizedBox(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: ColorsCollection.GreyNeutral02,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: const Icon(Icons.remove, size: 14),
                                    ),
                                    const Text("1"),
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: ColorsCollection.GreyNeutral02,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: const Icon(
                                        Icons.add,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Please note anything",
                    hintStyle: AppTextStyles.hintText,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorsCollection.GreyNeutral02),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorsCollection.GreyNeutral02),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        hintText: "Change Point",
                        hintStyle: AppTextStyles.hintstyletext,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 1,
                            color: ColorsCollection.GreyNeutral02,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: ColorsCollection.GreyNeutral02,
                          ),
                        ),
                        suffixIcon: SizedBox(
                          width: 100,
                          child: CustomButton(
                              buttonType: ButtonType.filled,
                              text: "Apply",
                              onPressed: () {}),
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Point Tersedia: 0',
                  style: AppTextStyles.subtitleStyle,
                ),
                const SizedBox(height: 24),
                Text(
                  'Payment Details',
                  style: AppTextStyles.titleProduct,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price', style: AppTextStyles.subtitleStyle),
                    Text('Rp. 26.000', style: AppTextStyles.subtitleStyle),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Discount', style: AppTextStyles.subtitleStyle),
                    Text('Rp 0', style: AppTextStyles.subtitleStyle),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax', style: AppTextStyles.subtitleStyle),
                    Text('Rp. 28.600', style: AppTextStyles.subtitleStyle),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
            height: 100,
            decoration: const BoxDecoration(
              color: ColorsCollection.WhiteNeutral,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorsCollection.BlackNeutral,
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: Offset(1, 12), // Shadow position
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total :",
                                style: AppTextStyles.subtitleStyleBlack,
                              ),
                              Text(
                                "Rp.26.000",
                                style: AppTextStyles.titleStyleBlack,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          text: "Order",
                          onPressed: () {},
                          buttonType: ButtonType.filled,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )));
  }
}
