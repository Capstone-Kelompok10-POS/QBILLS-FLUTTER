import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/view/chip/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listChoices = <ItemChoice>[
    ItemChoice(1, '7 Hari'),
    ItemChoice(2, '14 Hari'),
    ItemChoice(3, '1 Bulan'),
    ItemChoice(4, '3 Bulan'),
    ItemChoice(5, '3 Bulan'),
    ItemChoice(6, '3 Bulan'),
    ItemChoice(7, '3 Bulan'),
    ItemChoice(8, '3 Bulan'),
  ];
  var idSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: ColorsCollection.unSelectedColor,
                        backgroundImage: AssetImage('images/logo.png'),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Menggeser teks ke atas
                            children: [
                              Text('Good Morning',
                                  style: GoogleFonts.openSans(
                                      fontSize: 12, color: Colors.black)),
                              Text('Hello, Aksara Coffee',
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26.0),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.openSans(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(153, 153, 153, 1),
                    height: 1.0,
                  ),
                  isDense: true,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(
                          153, 153, 153, 1), // Warna garis outline
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(
                          153, 153, 153, 1), // Warna garis outline saat fokus
                    ),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color.fromRGBO(153, 153, 153, 1),
                  ),
                ),
                style: GoogleFonts.openSans(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(153, 153, 153, 1),
                  height: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(width: 20),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Wrap(
                    spacing: 12,
                    children: listChoices
                        .map((e) => ChoiceChip(
                              label: Text(e.label),
                              selected: idSelected == e.id,
                              onSelected: (_) =>
                                  setState(() => idSelected = e.id),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
