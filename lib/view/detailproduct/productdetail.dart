import 'package:flutter/material.dart';
import 'package:pos_capstone/view/cart/cartitem.dart';
import 'package:pos_capstone/view/homepage.dart';

class ViewDetail extends StatefulWidget {
  const ViewDetail({super.key});

  @override
  State<ViewDetail> createState() => _ViewDetailState();
}

class CoffeeSize {
  final int id;
  final String imgPath;
  final String sizing;
  final String capacity;

  CoffeeSize(this.id, this.imgPath, this.sizing, this.capacity);
}

class _ViewDetailState extends State<ViewDetail> {
  final listSize = <CoffeeSize>[
    CoffeeSize(1, 'images/cup.png', 'Normal', '220ml'),
    CoffeeSize(2, 'images/cup.png', 'Small', '120ml'),
    CoffeeSize(3, 'images/cup.png', 'Big', '320ml'),
  ];
  var idSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage("images/cappucinoespreso.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_sharp),
                color: Colors.black,
                onPressed: () {
                  // Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              bottom: 0,
              top: 350,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cappucino Espresso',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Divider(),
                      const SizedBox(height: 15),
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4c4c4c),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'The main ingredients in milk coffee is coffee, which is ground coffee or coffee extract. Soy milk is also a key component. In addition, sugar is added according to the dosage to provide a sweet taste.',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Color(0xff999999),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Size',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4c4c4c),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 70,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Wrap(
                              spacing: 12,
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
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      selectedColor: const Color(0xffbe8465),
                                      side: const BorderSide(
                                        color: Color(0xffe6e6e6),
                                      ),
                                      backgroundColor: Colors.white,
                                      label: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.sizing,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: idSelected == e.id
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          Text(
                                            e.capacity,
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13,
                                              color: idSelected == e.id
                                                  ? Colors.white
                                                  : Colors.grey,
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 130,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Total: ',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Rp 26.000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
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
                      const SizedBox(width: 15),
                      const Text('1'),
                      const SizedBox(width: 15),
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
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffbe8465),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
