import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/models/product_model.dart';

import 'package:pos_capstone/view/cart/cartitem.dart';
import 'package:pos_capstone/viewmodel/view_model_product.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.data});
  final Result data;
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
  final listSize = <CoffeeSize>[];

  var idSelected = 1;
  int quantity = 1;
  double totalPrice = 0;
  bool isChoice = false;
  String sizeSelected = "";

  void updateTotalPrice() {
    setState(() {
      totalPrice = data.productDetail[0].price * quantity.toDouble();
    });
  }

  late final Result data;
  // late final ProductDetail datadetail;
  late final List<ProductDetail> datadetail;
  @override
  void initState() {
    super.initState();
    data = widget.data;
    datadetail = widget.data.productDetail;
    for (int i = 0; i < datadetail.length; i++) {
      listSize.add(CoffeeSize(i, "images/cup.png", datadetail[i].size, "-"));
    }
    setState(() {});
    totalPrice = data.productDetail[0].price * quantity.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    print(datadetail);
    return Scaffold(
        backgroundColor: ColorsCollection.WhiteNeutral,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorsCollection.WhiteNeutral,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        IconButton(
                            constraints: const BoxConstraints(
                                minWidth: 24, minHeight: 24),
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: ColorsCollection.BlackNeutral,
                            )),
                        const SizedBox(width: 10),
                        Text(
                          'Detail Item',
                          style: AppTextStyles.appbartitle,
                        ),
                      ],
                    ),
                  ),
                  Consumer<ProductProvider>(
                    builder: (context, value, child) {
                      return Badge(
                        alignment: Alignment.topRight,
                        label: Text(value.cartItems.length.toString()),
                        smallSize: 10,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                                minWidth: 24, minHeight: 24),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartItems()),
                              );
                            },
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: ColorsCollection.BlackNeutral,
                            )),
                      );
                    },
                  )
                ],
              ),
            )),
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  color: Colors.red,
                  height: 300,
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(data.image),
                    fit: BoxFit.fitWidth,
                  )),
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
                          Text(data.name,
                              style: AppTextStyles.titleStyleBlack1),
                          const SizedBox(height: 20),
                          const Divider(
                            thickness: 0.8,
                          ),
                          const SizedBox(height: 20),
                          Text('Ingredients', style: AppTextStyles.title2),
                          const SizedBox(height: 8),
                          Text(data.ingredients,
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
                                        isChoice ? e.imgPath : e.imgPath,
                                        color: isChoice
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
                                            color: isChoice
                                                ? ColorsCollection.WhiteNeutral
                                                : ColorsCollection.BlackNeutral,
                                          ),
                                        ),
                                        Text(
                                          e.capacity,
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            color: isChoice
                                                ? ColorsCollection.WhiteNeutral
                                                : ColorsCollection.GreyNeutral,
                                          ),
                                        )
                                      ],
                                    ),
                                    // selected: idSelected == e.id,
                                    selected: isChoice,
                                    onSelected: (value) => setState(() {
                                      print(isChoice);
                                      isChoice = value;
                                      sizeSelected = e.sizing;
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
        bottomNavigationBar: Consumer<ProductProvider>(
          builder: (context, value, child) {
            return Container(
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
                                  "Total : ",
                                  style: AppTextStyles.subtitleStyleBlack,
                                ),
                                Text(
                                  "Rp.${totalPrice.toStringAsFixed(0)}",
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
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (quantity > 1) {
                                        quantity--; // Decrease quantity
                                        updateTotalPrice();
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color:
                                                ColorsCollection.GreyNeutral02),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Icon(Icons.remove, size: 14),
                                  ),
                                ),
                                Text(quantity.toString()),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      setState(() {
                                        quantity++; // Increase quantity
                                        updateTotalPrice(); // Update total price
                                      });
                                    });
                                  },
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color:
                                                ColorsCollection.GreyNeutral02),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Icon(
                                      Icons.add,
                                      size: 14,
                                    ),
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
                          print(idSelected);
                          print(isChoice);
                          if (!isChoice) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Size Belum Dipilih")));
                            return;
                          }
                          value.addToCartItem(
                              data.id.toString(),
                              data.image,
                              sizeSelected,
                              data.name,
                              data.productDetail[0].price.toString(),
                              quantity);
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
                ));
          },
        ));
  }
}
