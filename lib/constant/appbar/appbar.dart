import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/cart/cartitem.dart';
import 'package:pos_capstone/view/chip/model.dart';

class AppbarProduct extends StatefulWidget {
  const AppbarProduct({super.key});

  @override
  State<AppbarProduct> createState() => _AppbarProductState();
}

class _AppbarProductState extends State<AppbarProduct> {
  final listChoices = <ItemChoice>[
    ItemChoice(1, 'Coffee', Icons.local_cafe_outlined),
    ItemChoice(2, 'Non Coffee', Icons.local_drink),
    ItemChoice(3, 'Meals', Icons.restaurant),
    ItemChoice(4, 'Snack', Icons.fastfood),
  ];
  var idSelected = 1;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 210,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: CustomPadding.kSidePadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(children: [
                    Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorsCollection.unSelectedColor,
                            backgroundImage:
                                AssetImage('images/aksaracoffe.png'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Good Morning',
                              style: AppTextStyles.subtitleStyleBlack),
                          Text('Hello, Aksara Coffee',
                              style: AppTextStyles.titleStyleBlack),
                        ])
                  ]),
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 24,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartDetail()),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: ColorsCollection.BlackNeutral,
                    ))
              ],
            ),
          ),
          const SizedBox(height: 24),
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
                  size: 24,
                  color: ColorsCollection.GreyNeutral,
                ),
              ),
              style: AppTextStyles.hintTextSearch,
            ),
          ),
          const SizedBox(height: 16),
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
                            borderRadius: BorderRadiusDirectional.circular(40),
                          ),
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          labelPadding: const EdgeInsets.only(left: 4),
                          avatar: Icon(
                            idSelected == e.id ? e.avataricon : e.avataricon,
                            color: idSelected == e.id
                                ? ColorsCollection.WhiteNeutral
                                : ColorsCollection.GreyNeutral,
                          ),
                          selectedColor: ColorsCollection.PrimaryColor,
                          backgroundColor: ColorsCollection.GreyNeutral02,
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
        ],
      ),
    );
  }
}

class AppbarReport extends StatelessWidget {
  const AppbarReport({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
