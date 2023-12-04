import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int? _selectedPaymentMethod;
  int? _selectedBank;
  double _bottomSheetHeight = 0.5;

  void _updateBottomSheetHeight(double height) {
    setState(() {
      _bottomSheetHeight = height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Cart Item',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Search membership',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 45,
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0xffe6e6e6),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffe6e6e6),
                        ),
                      ),
                      suffixIcon: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffbe8465),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      labelText: 'Phone number',
                      labelStyle: const TextStyle(
                        color: Color(0xff999999),
                      )),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 87,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage('images/coffee.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cappucino Espresso',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const Text('Rp 24.000'),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 35,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      side: const BorderSide(
                                        color: Color(0xffbe8465),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.edit_outlined,
                                          color: Color(0xffbe8465),
                                          size: 15,
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          'Edit',
                                          style: TextStyle(
                                            color: Color(0xffbe8465),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.black,
                          ),
                          onTap: () {},
                        ),
                        Row(
                          children: [
                            InkWell(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: const Color(0xffe6e6e6),
                                    width: 1,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  size: 10,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {},
                            ),
                            const SizedBox(width: 5),
                            const Text('1'),
                            const SizedBox(width: 5),
                            InkWell(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: const Color(0xffe6e6e6),
                                    width: 1,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 10,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Please note anything',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe6e6e6)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe6e6e6)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe6e6e6)),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0xffe6e6e6),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffe6e6e6),
                      ),
                    ),
                    suffixIcon: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffbe8465),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    labelText: 'Discount',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Point Tersedia: 0',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 18),
              const Text(
                'Payment Details',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15),
              const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price',
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      Text('Rp 26.000',
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discount',
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      Text('Rp 0',
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax',
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      Text('Rp 2.600',
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Payment',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rp 28.000',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xffe6e6e6).withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    'Rp 26.000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffbe8465),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: SvgPicture.asset(
                                    'images/Rectangle3679.svg',
                                    width: 53,
                                    height: 4,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Payment Method',
                                  // style: AppTextStyles.headerPayment,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Please fill in the nominal value correctly',
                                  // style: AppTextStyles.subnPayment,
                                ),
                                const SizedBox(height: 20),
                                ListTile(
                                  leading: const Icon(Icons.money_outlined,
                                      color: ColorsCollection.BlackNeutral),
                                  title: Text(
                                    'Cash',
                                    // style: AppTextStyles.subnPaymentChoose,
                                  ),
                                  trailing: Radio(
                                    focusColor: ColorsCollection.GreyNeutral,
                                    value: 1,
                                    groupValue: _selectedPaymentMethod,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _selectedPaymentMethod = value;
                                      });
                                    },
                                    activeColor: ColorsCollection.PrimaryColor,
                                  ),
                                ),
                                const Divider(
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Icons.attach_file_outlined,
                                    color: ColorsCollection.BlackNeutral,
                                  ),
                                  title: Text(
                                    'QRIS',
                                    // style: AppTextStyles.subnPaymentChoose,
                                  ),
                                  trailing: Radio(
                                    value: 2,
                                    groupValue: _selectedPaymentMethod,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _selectedPaymentMethod = value;
                                      });
                                    },
                                    activeColor: ColorsCollection.PrimaryColor,
                                  ),
                                ),
                                const Divider(
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                Column(
                                  children: [
                                    ExpansionTile(
                                      textColor: ColorsCollection.BlackNeutral,
                                      iconColor: ColorsCollection.GreyNeutral,
                                      collapsedIconColor:
                                          ColorsCollection.GreyNeutral,
                                      leading: const Icon(
                                          Icons.payment_outlined,
                                          color: ColorsCollection.BlackNeutral),
                                      title: Text(
                                        'Transfer Bank',
                                        // style: AppTextStyles.subnPaymentChoose,
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.expand_more_outlined,
                                          color: ColorsCollection.GreyNeutral,
                                        ),
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 52, right: 20),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: SvgPicture.asset(
                                                  'images/bca.svg',
                                                ),
                                                title: Text(
                                                  'Bank BCA',
                                                  // style:
                                                  // AppTextStyles.subnPaymentBank,
                                                ),
                                                trailing: Radio(
                                                  value: 1,
                                                  groupValue: _selectedBank,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      _selectedBank = value;
                                                    });
                                                  },
                                                  activeColor: ColorsCollection
                                                      .PrimaryColor,
                                                ),
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                height: 10,
                                                indent: 20,
                                                endIndent: 20,
                                              ),
                                              ListTile(
                                                leading: SvgPicture.asset(
                                                  'images/mandiri.svg',
                                                ),
                                                title: Text(
                                                  'Bank Mandiri',
                                                  // style:
                                                  // AppTextStyles.subnPaymentBank,
                                                ),
                                                trailing: Radio(
                                                  value: 2,
                                                  groupValue: _selectedBank,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      _selectedBank = value;
                                                    });
                                                  },
                                                  activeColor: ColorsCollection
                                                      .PrimaryColor,
                                                ),
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                height: 10,
                                                indent: 20,
                                                endIndent: 20,
                                              ),
                                              ListTile(
                                                leading: Image.asset(
                                                    'images/permata.png'),
                                                title: Text(
                                                  'Bank Permata',
                                                  // style:
                                                  // AppTextStyles.subnPaymentBank,
                                                ),
                                                trailing: Radio(
                                                  value: 3,
                                                  groupValue: _selectedBank,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      _selectedBank = value;
                                                    });
                                                  },
                                                  activeColor: ColorsCollection
                                                      .PrimaryColor,
                                                ),
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                height: 10,
                                                indent: 20,
                                                endIndent: 20,
                                              ),
                                              ListTile(
                                                leading: Image.asset(
                                                    'images/bankbni.png'),
                                                title: Text(
                                                  'Bank BNI',
                                                  // style:
                                                  // AppTextStyles.subnPaymentBank,
                                                ),
                                                trailing: Radio(
                                                  value: 4,
                                                  groupValue: _selectedBank,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      _selectedBank = value;
                                                    });
                                                  },
                                                  activeColor: ColorsCollection
                                                      .PrimaryColor,
                                                ),
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                height: 10,
                                                indent: 20,
                                                endIndent: 20,
                                              ),
                                              ListTile(
                                                leading: SvgPicture.asset(
                                                    'images/bri.svg'),
                                                title: Text(
                                                  'Bank BRI',
                                                  // style:
                                                  // AppTextStyles.subnPaymentBank,
                                                ),
                                                trailing: Radio(
                                                  value: 5,
                                                  groupValue: _selectedBank,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      _selectedBank = value;
                                                    });
                                                  },
                                                  activeColor: ColorsCollection
                                                      .PrimaryColor,
                                                ),
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                height: 10,
                                                indent: 20,
                                                endIndent: 20,
                                              ),
                                              ListTile(
                                                leading: Image.asset(
                                                    'images/cimb.png'),
                                                title: Text(
                                                  'Bank CIMB',
                                                  // style:
                                                  //     AppTextStyles.subnPaymentBank,
                                                ),
                                                trailing: Radio(
                                                  value: 6,
                                                  groupValue: _selectedBank,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      _selectedBank = value;
                                                    });
                                                  },
                                                  activeColor: ColorsCollection
                                                      .PrimaryColor,
                                                ),
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                height: 10,
                                                indent: 20,
                                                endIndent: 20,
                                              ),
                                              ListTile(
                                                leading: const Icon(Icons
                                                    .account_balance_outlined),
                                                title: Text(
                                                  'Other Bank',
                                                  // style:
                                                  //     AppTextStyles.subnPaymentBank,
                                                ),
                                                trailing: Radio(
                                                  value: 7,
                                                  groupValue: _selectedBank,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      _selectedBank = value;
                                                    });
                                                  },
                                                  activeColor: ColorsCollection
                                                      .PrimaryColor,
                                                ),
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                height: 10,
                                                indent: 20,
                                                endIndent: 20,
                                              ),
                                              // ... (tambahkan ListTile untuk bank lainnya)
                                            ],
                                          ),
                                        ),
                                      ],
                                      onExpansionChanged: (isExpanded) {
                                        setState(() {
                                          if (isExpanded) {
                                            double maxHeight =
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.5; // Tinggi default
                                            // Sesuaikan dengan jumlah item yang sebenarnya
                                            maxHeight += 10 *
                                                2; // Sesuaikan dengan jumlah item yang sebenarnya
                                            _updateBottomSheetHeight(maxHeight);
                                          } else {
                                            _updateBottomSheetHeight(
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.5); // Tinggi default
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: CustomPadding.kSidePadding,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              ColorsCollection.PrimaryColor),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                        Size(
                                          double.infinity,
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Choose',
                                      // style: AppTextStyles.buttonPayment,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
