import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

import 'package:pos_capstone/view/cart/cartitem.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class CoffeeSize {
  final int id;
  final String imgPath;
  final String sizing;
  final String capacity;

  CoffeeSize(this.id, this.imgPath, this.sizing, this.capacity);
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final listSize = <CoffeeSize>[
    CoffeeSize(1, 'images/cup.png', 'Normal', '220ml'),
    CoffeeSize(2, 'images/cup.png', 'Small', '120ml'),
    CoffeeSize(3, 'images/cup.png', 'Big', '320ml'),
  ];
  var idSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsCollection.WhiteNeutral,
        appBar: AppBar(
          title: Text(
            'Detail Item',
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
          actions: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartItems()),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorsCollection.BlackNeutral,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 300,
                child: Image.asset(
                  "images/kopi1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 280),
                child: Container(
                  decoration: const BoxDecoration(
                    color: ColorsCollection.WhiteNeutral,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(children: [
                    Padding(
                      padding: CustomPadding.kSidePadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          Text('Cappucino Espresso',
                              style: AppTextStyles.titleStyleBlack1),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 20),
                          Text('Ingredients', style: AppTextStyles.title2),
                          const SizedBox(height: 8),
                          Text(
                              'The main ingredients in milk coffee is coffee, which is ground coffee or coffee extract. Soy milk is also a key component. In addition, sugar is added according to the dosage to provide a sweet taste.',
                              style: AppTextStyles.subtitleStyle),
                          const SizedBox(height: 20),
                          Text('Size', style: AppTextStyles.title2),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 70,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Wrap(
                            spacing: 8,
                            children: listSize
                                .map(
                                  (e) => FilterChip(
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    avatar: Image.asset(
                                        height: 30,
                                        width: 30,
                                        idSelected == e.id
                                            ? e.imgPath
                                            : e.imgPath,
                                        color: idSelected == e.id
                                            ? ColorsCollection.WhiteNeutral
                                            : ColorsCollection.BlackNeutral),
                                    selectedColor:
                                        ColorsCollection.PrimaryColor,
                                    side: const BorderSide(
                                      color: ColorsCollection.GreyNeutral02,
                                    ),
                                    backgroundColor:
                                        ColorsCollection.WhiteNeutral,
                                    label: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.sizing,
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: idSelected == e.id
                                                ? ColorsCollection.WhiteNeutral
                                                : ColorsCollection.BlackNeutral,
                                          ),
                                        ),
                                        Text(
                                          e.capacity,
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            color: idSelected == e.id
                                                ? ColorsCollection.WhiteNeutral
                                                : ColorsCollection.GreyNeutral,
                                          ),
                                        )
                                      ],
                                    ),
                                    selected: idSelected == e.id,
                                    onSelected: (_) => setState(() {
                                      if (idSelected == e.id) {
                                        idSelected = 0;
                                      } else {
                                        idSelected = e.id;
                                      }
                                    }),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            height: 132,
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
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              "Total :",
                              style: AppTextStyles.subtitleStyleBlack,
                            ),
                            Text(
                              " Rp.26.000",
                              style: AppTextStyles.titleStyleBlack,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: ColorsCollection.GreyNeutral02),
                                  borderRadius: BorderRadius.circular(6)),
                              child: const Icon(Icons.remove, size: 14),
                            ),
                            const Text("1"),
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: ColorsCollection.GreyNeutral02),
                                  borderRadius: BorderRadius.circular(6)),
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
                  const SizedBox(height: 16),
                  CustomButton(
                    iconData: Icons.shopping_cart,
                    text: "Add to Cart",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartItems()),
                      );
                    },
                    buttonType: ButtonType.withIcon,
                  )
                ],
              ),
            )));
  }
}
