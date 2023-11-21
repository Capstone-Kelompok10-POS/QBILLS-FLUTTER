import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/chip/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listChoices = <ItemChoice>[
    ItemChoice(1, 'Coffee', Icons.local_cafe),
    ItemChoice(2, 'Non Coffee', Icons.local_drink),
    ItemChoice(3, 'Meals', Icons.restaurant),
    ItemChoice(4, 'Snack', Icons.fastfood),
  ];
  var idSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: CustomPadding.kSidePadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: ColorsCollection.unSelectedColor,
                    backgroundImage: const AssetImage('images/aksaracoffe.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Good Morning',
                            style: AppTextStyles.tittlestyleBlack),
                        Text('Hello, Aksara Coffee',
                            style: AppTextStyles.subtitlestyleBlack),
                      ])
                ]),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: 24,
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: ColorsCollection.BlackNeutral,
                  ))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: CustomPadding.kSidePadding,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         children: [
            //           const CircleAvatar(
            //             radius: 20,
            //             backgroundColor: ColorsCollection.unSelectedColor,
            //             backgroundImage: AssetImage('images/aksaracoffe.png'),
            //           ),
            //           const SizedBox(width: 13),
            //           Column(
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment
            //                     .center, // Menggeser teks ke atas
            //                 children: [
            //                   Text('Good Morning',
            //                       style: AppTextStyles.goodMorning),
            //                   Text('Hello, Aksara Coffee',
            //                       style: AppTextStyles.userWelcome),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //       const Icon(
            //         Icons.shopping_cart_outlined,
            //         color: Colors.black,
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 24.0),
            Padding(
              padding: CustomPadding.kSidePadding,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: AppTextStyles.hintTextSearch,
                  isDense: true,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: ColorsCollection.GreyNeutral),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: ColorsCollection.GreyNeutral),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: ColorsCollection.GreyNeutral,
                  ),
                ),
                style: AppTextStyles.hintTextSearch,
              ),
            ),
            const SizedBox(height: 16),
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
                        .map(
                          (e) => ChoiceChip(
                            labelStyle: TextStyle(
                              color: idSelected == e.id
                                  ? ColorsCollection.WhiteNeutral
                                  : ColorsCollection.GreyNeutral,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(40),
                              side: const BorderSide(
                                color: ColorsCollection.GreyNeutral,
                              ),
                            ),
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            labelPadding: const EdgeInsets.only(left: 4),
                            avatar: Icon(
                              idSelected == e.id
                                  ? Icons.close_outlined
                                  : e.avataricon,
                              color: idSelected == e.id
                                  ? ColorsCollection.WhiteNeutral
                                  : ColorsCollection.GreyNeutral,
                            ),
                            selectedColor: ColorsCollection.PrimaryColor,
                            backgroundColor: ColorsCollection.WhiteNeutral,
                            label: Text(e.label),
                            selected: idSelected == e.id,
                            onSelected: (_) => setState(() {
                              if (idSelected == e.id) {
                                idSelected =
                                    0; // Nonaktifkan kategori jika sudah dipilih
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
            const SizedBox(height: 16),
            Padding(
              padding: CustomPadding.kSidePadding,
              child: Column(children: [
                Text(
                  'Products',
                  style: AppTextStyles.textProduct,
                )
              ]),
            ),
            Padding(
              padding: CustomPadding.kSidePadding,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio:
                          MediaQuery.of(context).size.width * 0.0019,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: CustomPadding.kTopCardPadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.095,
                                child: Container(
                                  padding: CustomPadding
                                      .kInsideBoxCardPadding, // Jarak atas bawah
                                  margin: CustomPadding.kSideBoxCardPadding,
                                  decoration: BoxDecoration(
                                    color: ColorsCollection.BoxCard,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    'images/cappucinoespreso.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: CustomPadding.kSideCardPadding,
                                    child: Text(
                                      'Cappucino Espresso',
                                      style: AppTextStyles.titleProduct,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: CustomPadding.kSideCardPadding,
                                    child: Text(
                                      'coffee from espresso, steamed milk, & milk foam',
                                      style: AppTextStyles.descriptionProduct,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: CustomPadding.kSideCardPadding,
                                    child: Text(
                                      'Rp 26.000',
                                      style: AppTextStyles.priceProduct,
                                    ),
                                  ),
                                  Padding(
                                    padding: CustomPadding.kSideCardPadding,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 35,
                                      height: 35,
                                      padding: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        color: ColorsCollection.PrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: const Icon(
                                        Icons.chevron_right_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
