import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_capstone/constant/button/button_collection.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/payment/payment_detail.dart';
import 'package:pos_capstone/view/payment/payment_process.dart';
import 'package:pos_capstone/view/payment/payment_qris.dart';
import 'package:pos_capstone/viewmodel/view_model_convertpointmember.dart';
import 'package:pos_capstone/viewmodel/view_model_membership.dart';
import 'package:pos_capstone/viewmodel/view_model_paymentmethod.dart';
import 'package:pos_capstone/viewmodel/view_model_product.dart';
import 'package:provider/provider.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  int _selectedRadio = 0;
  bool _isExpanded = false;
  late int amount = 1;
  double totalPrice = 0;
  double totalAll = 0;
  late ProductProvider productProvider;
  late MembershipProvider membershipProvider;
  late ViewModelPaymentMethod paymentMethodProvider;
  final TextEditingController _phoneNumberController = TextEditingController();
  late ViewModelConvertPointMember pointProvider;

  double _calculateBottomSheetHeight() {
    double baseHeight = 400;
    double expandedHeight = 420;

    return _isExpanded ? baseHeight + expandedHeight : baseHeight;
  }

  @override
  Widget build(BuildContext context) {
    pointProvider =
        Provider.of<ViewModelConvertPointMember>(context, listen: false);
    pointProvider.getConvertPointMembers();
    membershipProvider =
        Provider.of<MembershipProvider>(context, listen: false);
    paymentMethodProvider =
        Provider.of<ViewModelPaymentMethod>(context, listen: false);
    paymentMethodProvider.getPaymentMethod();
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
        body: Consumer<ProductProvider>(builder: (context, value, child) {
          if (value.cartItems.isEmpty) {
            return const Center(
              child: Text(
                'Tidak Ada Produk',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            totalPrice = value.calculateTotalPrice(value.cartItems);
            return SingleChildScrollView(
              child: Padding(
                padding: CustomPadding.kSidePadding,
                child: Consumer(
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Search Membership',
                            style: AppTextStyles.titleProduct),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            controller: _phoneNumberController,
                            onChanged: (query) {},
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
                                suffixIcon: Consumer(
                                  builder: (context, value, child) {
                                    return SizedBox(
                                      width: 100,
                                      child: CustomButton(
                                          buttonType: ButtonType.filled,
                                          text: "Search",
                                          onPressed: () {
                                            final phoneNumber =
                                                _phoneNumberController.text;
                                            if (phoneNumber.isNotEmpty) {
                                              membershipProvider
                                                  .getMembersByPhoneNumber(
                                                      phoneNumber);
                                            }
                                          }),
                                    );
                                  },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 70,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image:
                                                      NetworkImage(data.image),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  data.nameSize,
                                                  style:
                                                      AppTextStyles.subtitle2,
                                                ),
                                                IconButton(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .zero,
                                                    constraints:
                                                        const BoxConstraints(
                                                            minHeight: 24,
                                                            minWidth: 24),
                                                    onPressed: () {
                                                      Provider.of<ProductProvider>(
                                                              context,
                                                              listen: false)
                                                          .removeCartItem(
                                                              index);
                                                    },
                                                    icon: const Icon(
                                                        Icons.close,
                                                        size: 20))
                                              ],
                                            ),
                                            Text(
                                              data.name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyles.titleProduct,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                                (value.cartItems[index].price *
                                                        value.cartItems[index]
                                                            .amount)
                                                    .toString(),
                                                style: AppTextStyles
                                                    .subtitleStyleBlack),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomButton(
                                                    height: 30,
                                                    width: 90,
                                                    iconData:
                                                        Icons.edit_outlined,
                                                    buttonType: ButtonType
                                                        .outlineWithIcon,
                                                    text: "edit",
                                                    onPressed: () {}),
                                                SizedBox(
                                                  width: 80,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            if (value
                                                                    .cartItems[
                                                                        index]
                                                                    .amount >
                                                                1) {
                                                              value
                                                                  .cartItems[
                                                                      index]
                                                                  .amount--;
                                                              totalPrice -= value
                                                                  .cartItems[
                                                                      index]
                                                                  .price; // Kurangi jumlah produk
                                                              // Perbarui harga total produk
                                                            }
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 24,
                                                          width: 24,
                                                          decoration: BoxDecoration(
                                                              color: ColorsCollection
                                                                  .GreyNeutral02,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6)),
                                                          child: const Icon(
                                                              Icons.remove,
                                                              size: 14),
                                                        ),
                                                      ),
                                                      Text(value
                                                          .cartItems[index]
                                                          .amount
                                                          .toString()),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            value
                                                                .cartItems[
                                                                    index]
                                                                .amount++;
                                                            totalPrice -= value
                                                                .cartItems[
                                                                    index]
                                                                .price; // Tambah jumlah produk
                                                            // Perbarui harga total produk
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 24,
                                                          width: 24,
                                                          decoration: BoxDecoration(
                                                              color: ColorsCollection
                                                                  .GreyNeutral02,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6)),
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
                                            const SizedBox(height: 10),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText:
                                                    "Please note anything",
                                                hintStyle:
                                                    AppTextStyles.hintText,
                                                enabledBorder:
                                                    const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorsCollection
                                                          .GreyNeutral02),
                                                ),
                                                focusedBorder:
                                                    const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorsCollection
                                                          .GreyNeutral02),
                                                ),
                                              ),
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
                        const SizedBox(height: 20),
                        Consumer<ViewModelConvertPointMember>(
                          builder: (context, value, _) {
                            return DropdownButtonFormField<int>(
                              value: value.selectedValue != 0
                                  ? value.selectedValue
                                  : null,
                              items: value.dropdownItems
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                value.updateSelectedValue(newValue ?? 0);
                                // Panggil getValuePoint dengan selectedValue dari dropdown
                                newValue = value.selectedValue;
                                int valuePoint =
                                    pointProvider.getValuePoint(newValue);

                                // Cetak hasilnya
                                print('ValuePoint for $newValue: $valuePoint');

                                setState(() {
                                  valuePoint;
                                });
                              },
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
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Point Tersedia: ${membershipProvider.totalPoint}',
                          style: AppTextStyles.subtitleStyle,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Payment Details',
                          style: AppTextStyles.titleProduct,
                        ),
                        const SizedBox(height: 12),
                        Consumer<ViewModelConvertPointMember>(
                            builder: (context, value, _) {
                          int totalDiscount =
                              value.getValuePoint(pointProvider.selectedValue);
                          return Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Price',
                                    style: AppTextStyles.subtitleStyle),
                                Text('Rp. $totalPrice',
                                    style: AppTextStyles.subtitleStyle),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Consumer<ViewModelConvertPointMember>(
                                builder: (context, value, _) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Discount',
                                      style: AppTextStyles.subtitleStyle),
                                  Text('Rp $totalDiscount',
                                      style: AppTextStyles.subtitleStyle),
                                ],
                              );
                            }),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tax', style: AppTextStyles.subtitleStyle),
                                Text('Rp. ${totalPrice * 0.10}',
                                    style: AppTextStyles.subtitleStyle),
                              ],
                            ),
                          ]);
                        }),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),
            );
          }
        }),
        bottomNavigationBar: Consumer<ProductProvider>(
          builder: (context, value, child) {
            if (value.cartItems.isNotEmpty) {
              return Container(
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
                            Consumer<ViewModelConvertPointMember>(
                                builder: (context, value, _) {
                              int totalDiscount = value
                                  .getValuePoint(pointProvider.selectedValue);
                              double totalAll = (totalPrice - totalDiscount) +
                                  (totalPrice * 0.10);
                              return Expanded(
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total :",
                                        style: AppTextStyles.subtitleStyleBlack,
                                      ),
                                      Text(
                                        "Rp. $totalAll",
                                        style: AppTextStyles.titleStyleBlack,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                            Expanded(
                              child: CustomButton(
                                text: "Order",
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor:
                                          ColorsCollection.WhiteNeutral,
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
                                            height:
                                                _calculateBottomSheetHeight(),
                                            child: Padding(
                                              padding:
                                                  CustomPadding.kSidePadding,
                                              child: ListView(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                children: [
                                                  Consumer<
                                                      ViewModelPaymentMethod>(
                                                    builder: (context,
                                                        paymentMethodProvider,
                                                        child) {
                                                      return Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const SizedBox(
                                                              height: 10),
                                                          Center(
                                                            child: Container(
                                                              height: 4,
                                                              width: 50,
                                                              decoration: BoxDecoration(
                                                                  color: ColorsCollection
                                                                      .GreyNeutral02,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 36),
                                                          Text(
                                                            "Payment method",
                                                            style: AppTextStyles
                                                                .titleProduct,
                                                          ),
                                                          const SizedBox(
                                                              height: 4),
                                                          Text(
                                                            "Please fill in the nominal value correctly",
                                                            style: AppTextStyles
                                                                .subtitleStyle,
                                                          ),
                                                          const SizedBox(
                                                              height: 20),
                                                          RadioListTile(
                                                            activeColor:
                                                                ColorsCollection
                                                                    .PrimaryColor,
                                                            title: Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons
                                                                      .payments_sharp,
                                                                  color: ColorsCollection
                                                                      .BlackNeutral,
                                                                ),
                                                                const SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                    "${paymentMethodProvider.paymentMethod?.results[0].name}",
                                                                    style: AppTextStyles
                                                                        .title2)
                                                              ],
                                                            ),
                                                            value: 1,
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
                                                            activeColor:
                                                                ColorsCollection
                                                                    .PrimaryColor,
                                                            title: Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons
                                                                      .qr_code_scanner,
                                                                  color: ColorsCollection
                                                                      .BlackNeutral,
                                                                ),
                                                                const SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                    "${paymentMethodProvider.paymentMethod?.results[1].name}",
                                                                    style: AppTextStyles
                                                                        .title2)
                                                              ],
                                                            ),
                                                            value: 2,
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
                                                                const SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                    "Transfer bank",
                                                                    style: AppTextStyles
                                                                        .title2),
                                                              ],
                                                            ),
                                                            trailing:
                                                                IconButton(
                                                              constraints:
                                                                  const BoxConstraints(
                                                                      minHeight:
                                                                          24,
                                                                      minWidth:
                                                                          24),
                                                              icon: Icon(_isExpanded
                                                                  ? Icons
                                                                      .expand_less
                                                                  : Icons
                                                                      .expand_more),
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
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 40),
                                                              child: Column(
                                                                children: [
                                                                  RadioListTile(
                                                                    activeColor:
                                                                        ColorsCollection
                                                                            .PrimaryColor,
                                                                    title: Row(
                                                                      children: [
                                                                        SvgPicture
                                                                            .asset(
                                                                          "images/bankbca.svg",
                                                                          width:
                                                                              24,
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                10),
                                                                        Text(
                                                                            "Bank ${paymentMethodProvider.paymentMethod?.results[2].name}",
                                                                            style:
                                                                                AppTextStyles.title2)
                                                                      ],
                                                                    ),
                                                                    value: 4,
                                                                    groupValue:
                                                                        _selectedRadio,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      setState(
                                                                          () {
                                                                        _selectedRadio =
                                                                            value!;
                                                                      });
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => const PaymentProcess()));
                                                                    },
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .trailing,
                                                                  ),
                                                                  const Divider(
                                                                    color: ColorsCollection
                                                                        .GreyNeutral02,
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  RadioListTile(
                                                                    activeColor:
                                                                        ColorsCollection
                                                                            .PrimaryColor,
                                                                    title: Row(
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                            "images/cimbbank.svg",
                                                                            width:
                                                                                24),
                                                                        const SizedBox(
                                                                            width:
                                                                                10),
                                                                        Text(
                                                                            "Bank ${paymentMethodProvider.paymentMethod?.results[3].name}",
                                                                            style:
                                                                                AppTextStyles.title2)
                                                                      ],
                                                                    ),
                                                                    value: 7,
                                                                    groupValue:
                                                                        _selectedRadio,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      setState(
                                                                          () {
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
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  RadioListTile(
                                                                    activeColor:
                                                                        ColorsCollection
                                                                            .PrimaryColor,
                                                                    title: Row(
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                            "images/BNLI.svg",
                                                                            width:
                                                                                24),
                                                                        const SizedBox(
                                                                            width:
                                                                                10),
                                                                        Text(
                                                                            "Bank ${paymentMethodProvider.paymentMethod?.results[4].name}",
                                                                            style:
                                                                                AppTextStyles.title2)
                                                                      ],
                                                                    ),
                                                                    value: 3,
                                                                    groupValue:
                                                                        _selectedRadio,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      setState(
                                                                          () {
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
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  RadioListTile(
                                                                    activeColor:
                                                                        ColorsCollection
                                                                            .PrimaryColor,
                                                                    title: Row(
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                            "images/BBNI.svg",
                                                                            width:
                                                                                24),
                                                                        const SizedBox(
                                                                            width:
                                                                                10),
                                                                        Text(
                                                                            "Bank ${paymentMethodProvider.paymentMethod?.results[5].name}",
                                                                            style:
                                                                                AppTextStyles.title2)
                                                                      ],
                                                                    ),
                                                                    value: 6,
                                                                    groupValue:
                                                                        _selectedRadio,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      setState(
                                                                          () {
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
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  RadioListTile(
                                                                    activeColor:
                                                                        ColorsCollection
                                                                            .PrimaryColor,
                                                                    title: Row(
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                            "images/BBRI.svg",
                                                                            width:
                                                                                24),
                                                                        const SizedBox(
                                                                            width:
                                                                                10),
                                                                        Text(
                                                                            "Bank ${paymentMethodProvider.paymentMethod?.results[6].name}",
                                                                            style:
                                                                                AppTextStyles.title2)
                                                                      ],
                                                                    ),
                                                                    value: 5,
                                                                    groupValue:
                                                                        _selectedRadio,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      setState(
                                                                          () {
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
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          const SizedBox(
                                                              height: 20),
                                                          CustomButton(
                                                            text: "Choose",
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const CartDetail()),
                                                              );
                                                            },
                                                            buttonType:
                                                                ButtonType
                                                                    .filled,
                                                          ),
                                                          const SizedBox(
                                                              height: 20),
                                                        ],
                                                      );
                                                    },
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
                  ));
            } else {
              return const SizedBox.shrink();
            }
          },
        ));
  }
}
