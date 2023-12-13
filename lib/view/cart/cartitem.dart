import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/models/product_model.dart';
import 'package:pos_capstone/view/payment/payment_detail.dart';
import 'package:pos_capstone/view/payment/payment_process.dart';
import 'package:pos_capstone/view/payment/payment_qris.dart';
import 'package:pos_capstone/viewmodel/view_model_product.dart';
import 'package:provider/provider.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  int _selectedRadio = 0;
  bool _isExpanded = false;

  double _calculateBottomSheetHeight() {
    double baseHeight = 400;
    double expandedHeight = 420;

    return _isExpanded ? baseHeight + expandedHeight : baseHeight;
  }

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
                Consumer<ProductProvider>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        final data = value.cartItems[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 70,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(data.image),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data.nameSize,
                                          style: AppTextStyles.subtitle2,
                                        ),
                                        const Icon(Icons.close, size: 20),
                                      ],
                                    ),
                                    Text(
                                      data.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.titleProduct,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(data.price.toString(),
                                        style:
                                            AppTextStyles.subtitleStyleBlack),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomButton(
                                            height: 30,
                                            width: 90,
                                            iconData: Icons.edit_outlined,
                                            buttonType:
                                                ButtonType.outlineWithIcon,
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
                                                    color: ColorsCollection
                                                        .GreyNeutral02,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: const Icon(Icons.remove,
                                                    size: 14),
                                              ),
                                              Text(data.amount.toString()),
                                              Container(
                                                height: 24,
                                                width: 24,
                                                decoration: BoxDecoration(
                                                    color: ColorsCollection
                                                        .GreyNeutral02,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
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
                        );
                      },
                    );
                  },
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
                const SizedBox(height: 20),
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
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: ColorsCollection.WhiteNeutral,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                context: context,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10))),
                                builder: (BuildContext context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return SizedBox(
                                      height: _calculateBottomSheetHeight(),
                                      child: Padding(
                                        padding: CustomPadding.kSidePadding,
                                        child: ListView(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const SizedBox(height: 10),
                                                Center(
                                                  child: Container(
                                                    height: 4,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        color: ColorsCollection
                                                            .GreyNeutral02,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                  ),
                                                ),
                                                const SizedBox(height: 36),
                                                Text(
                                                  "Payment method",
                                                  style: AppTextStyles
                                                      .titleProduct,
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  "Please fill in the nominal value correctly",
                                                  style: AppTextStyles
                                                      .subtitleStyle,
                                                ),
                                                const SizedBox(height: 20),
                                                RadioListTile(
                                                  activeColor: ColorsCollection
                                                      .PrimaryColor,
                                                  title: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.payments_sharp,
                                                        color: ColorsCollection
                                                            .BlackNeutral,
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Text("Cash",
                                                          style: AppTextStyles
                                                              .title2)
                                                    ],
                                                  ),
                                                  value: 1,
                                                  groupValue: _selectedRadio,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      _selectedRadio = value!;
                                                    });
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const DetailCashPayment()));
                                                  },
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                ),
                                                const Divider(
                                                  color: ColorsCollection
                                                      .GreyNeutral02,
                                                  thickness: 1,
                                                ),
                                                RadioListTile(
                                                  activeColor: ColorsCollection
                                                      .PrimaryColor,
                                                  title: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.qr_code_scanner,
                                                        color: ColorsCollection
                                                            .BlackNeutral,
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Text("QRIS",
                                                          style: AppTextStyles
                                                              .title2)
                                                    ],
                                                  ),
                                                  value: 2,
                                                  groupValue: _selectedRadio,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      _selectedRadio = value!;
                                                    });
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const PaymentQris()));
                                                  },
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                ),
                                                const Divider(
                                                  color: ColorsCollection
                                                      .GreyNeutral02,
                                                  thickness: 1,
                                                ),
                                                ListTile(
                                                  title: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.payment,
                                                        color: ColorsCollection
                                                            .BlackNeutral,
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Text("Transfer bank",
                                                          style: AppTextStyles
                                                              .title2),
                                                    ],
                                                  ),
                                                  trailing: IconButton(
                                                    constraints:
                                                        const BoxConstraints(
                                                            minHeight: 24,
                                                            minWidth: 24),
                                                    icon: Icon(_isExpanded
                                                        ? Icons.expand_less
                                                        : Icons.expand_more),
                                                    onPressed: () {
                                                      setState(() {
                                                        _isExpanded =
                                                            !_isExpanded; // Toggle status ekspansi
                                                      });
                                                    },
                                                  ),
                                                ),
                                                if (_isExpanded)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 40),
                                                    child: Column(
                                                      children: [
                                                        RadioListTile(
                                                          activeColor:
                                                              ColorsCollection
                                                                  .PrimaryColor,
                                                          title: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                "images/bankbca.svg",
                                                                width: 24,
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text("Bank BCA",
                                                                  style:
                                                                      AppTextStyles
                                                                          .title2)
                                                            ],
                                                          ),
                                                          value: 3,
                                                          groupValue:
                                                              _selectedRadio,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              _selectedRadio =
                                                                  value!;
                                                            });
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const PaymentProcess()));
                                                          },
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing,
                                                        ),
                                                        const Divider(
                                                          color: ColorsCollection
                                                              .GreyNeutral02,
                                                          thickness: 1,
                                                        ),
                                                        RadioListTile(
                                                          activeColor:
                                                              ColorsCollection
                                                                  .PrimaryColor,
                                                          title: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  "images/mandiribank.svg",
                                                                  width: 24),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                  "Bank Mandiri",
                                                                  style:
                                                                      AppTextStyles
                                                                          .title2)
                                                            ],
                                                          ),
                                                          value: 4,
                                                          groupValue:
                                                              _selectedRadio,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              _selectedRadio =
                                                                  value!;
                                                            });
                                                          },
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing,
                                                        ),
                                                        const Divider(
                                                          color: ColorsCollection
                                                              .GreyNeutral02,
                                                          thickness: 1,
                                                        ),
                                                        RadioListTile(
                                                          activeColor:
                                                              ColorsCollection
                                                                  .PrimaryColor,
                                                          title: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  "images/BNLI.svg",
                                                                  width: 24),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                  "Bank Permata",
                                                                  style:
                                                                      AppTextStyles
                                                                          .title2)
                                                            ],
                                                          ),
                                                          value: 5,
                                                          groupValue:
                                                              _selectedRadio,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              _selectedRadio =
                                                                  value!;
                                                            });
                                                          },
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing,
                                                        ),
                                                        const Divider(
                                                          color: ColorsCollection
                                                              .GreyNeutral02,
                                                          thickness: 1,
                                                        ),
                                                        RadioListTile(
                                                          activeColor:
                                                              ColorsCollection
                                                                  .PrimaryColor,
                                                          title: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  "images/BBNI.svg",
                                                                  width: 24),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text("Bank BNI",
                                                                  style:
                                                                      AppTextStyles
                                                                          .title2)
                                                            ],
                                                          ),
                                                          value: 6,
                                                          groupValue:
                                                              _selectedRadio,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              _selectedRadio =
                                                                  value!;
                                                            });
                                                          },
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing,
                                                        ),
                                                        const Divider(
                                                          color: ColorsCollection
                                                              .GreyNeutral02,
                                                          thickness: 1,
                                                        ),
                                                        RadioListTile(
                                                          activeColor:
                                                              ColorsCollection
                                                                  .PrimaryColor,
                                                          title: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  "images/BBRI.svg",
                                                                  width: 24),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text("Bank BRI",
                                                                  style:
                                                                      AppTextStyles
                                                                          .title2)
                                                            ],
                                                          ),
                                                          value: 7,
                                                          groupValue:
                                                              _selectedRadio,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              _selectedRadio =
                                                                  value!;
                                                            });
                                                          },
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing,
                                                        ),
                                                        const Divider(
                                                          color: ColorsCollection
                                                              .GreyNeutral02,
                                                          thickness: 1,
                                                        ),
                                                        RadioListTile(
                                                          activeColor:
                                                              ColorsCollection
                                                                  .PrimaryColor,
                                                          title: Row(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .account_balance,
                                                                color: ColorsCollection
                                                                    .BlackNeutral,
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text("Other Bank",
                                                                  style:
                                                                      AppTextStyles
                                                                          .title2)
                                                            ],
                                                          ),
                                                          value: 8,
                                                          groupValue:
                                                              _selectedRadio,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              _selectedRadio =
                                                                  value!;
                                                            });
                                                          },
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                const SizedBox(height: 20),
                                                CustomButton(
                                                  text: "Choose",
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CartItems()),
                                                    );
                                                  },
                                                  buttonType: ButtonType.filled,
                                                ),
                                                const SizedBox(height: 20),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                });
                          },
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
