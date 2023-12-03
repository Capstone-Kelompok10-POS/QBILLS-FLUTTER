import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/chip/model.dart';
import 'package:pos_capstone/view/detailproduct/productdetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listChoices = <ItemChoice>[
    ItemChoice(1, 'Coffee', Icons.local_cafe_outlined),
    ItemChoice(2, 'Non Coffee', Icons.local_drink),
    ItemChoice(3, 'Meals', Icons.restaurant),
    ItemChoice(4, 'Snack', Icons.fastfood),
  ];
  var idSelected = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const GuideDialog();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.WhiteNeutral,
      appBar: AppBar(
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
                      onPressed: () {},
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
                              borderRadius:
                                  BorderRadiusDirectional.circular(40),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 16),
            Padding(
              padding: CustomPadding.kSidePadding,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      mainAxisExtent: 278,
                    ),
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      ColorsCollection.BlackNeutral.withOpacity(
                                          0.05),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 1))
                            ],
                            color: ColorsCollection.WhiteNeutral,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "images/cappucinoespreso.png"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Java Coffee",
                                style: AppTextStyles.titleProduct,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "coffee from espresso, steamed milk, & milk foam",
                                style: AppTextStyles.descriptionProduct,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Rp.26.000",
                                      style: AppTextStyles.titleProduct,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ViewDetail()),
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: ColorsCollection.PrimaryColor),
                                      child: const Icon(
                                        Icons.chevron_right,
                                        color: ColorsCollection.WhiteNeutral,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Handle item 1 press
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Handle item 2 press
              },
            ),
            // ... tambahkan item drawer lainnya sesuai kebutuhan ...
          ],
        ),
      ),
    );
  }
}

class GuideDialog extends StatefulWidget {
  const GuideDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GuideDialogState createState() => _GuideDialogState();
}

class _GuideDialogState extends State<GuideDialog> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  bool _isLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page == 2) {
        setState(() {
          _isLastPage = true;
        });
      } else {
        setState(() {
          _isLastPage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  Text("Manual Guide", style: AppTextStyles.hintstyletext),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 22, maxWidth: 22),
                    icon: const Icon(Icons.close,
                        color: ColorsCollection.GreyNeutral),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    // Your pages for the guide dialog
                    buildDialogPage1("images/comp1.png"),
                    buildDialogPage2("images/comp2.png"),
                    buildDialogPage3("images/comp3.png"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  3,
                  (int index) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: _currentPage == index ? 17 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _currentPage == index
                            ? ColorsCollection.PrimaryColor
                            : ColorsCollection.GreyNeutral02,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Center(
                          child: InkWell(
                    child: Visibility(
                        visible: _currentPage > 0,
                        child: Text(
                          "Back",
                          style: AppTextStyles.textStyleButtonBlack,
                        )),
                    onTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                  ))),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: ColorsCollection.PrimaryColor),
                        onPressed: () {
                          if (_isLastPage) {
                            Navigator.of(context)
                                .pop(); // Close dialog on Finish
                          } else {
                            if (_currentPage < 2) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            }
                          }
                        },
                        child: Text(
                          _isLastPage ? 'Finish' : 'Next',
                          style: AppTextStyles.textStyleButton,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDialogPage1(String imagePath) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Image.asset(
            imagePath,
            width: 200,
          ),
          const SizedBox(height: 20),
          Text(
            "Manage Product",
            style: AppTextStyles.titleStyleBlack1,
          ),
          const SizedBox(height: 12),
          Text(
            textAlign: TextAlign.center,
            "Manage product provides product-related information such as name, category, price, and ingridients. Make it easy for you to know the products available.",
            style: AppTextStyles.subtitleStyle,
          ),
        ],
      ),
    );
  }

  Widget buildDialogPage2(String imagePath) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Image.asset(
            imagePath,
            width: 200,
          ),
          const SizedBox(height: 20),
          Text(
            "Sales Reports",
            style: AppTextStyles.titleStyleBlack1,
          ),
          const SizedBox(height: 12),
          Text(
            textAlign: TextAlign.center,
            'In the "Reports" menu, access detail information about daily, monthly, or yearly sales. Analyzing this data can help you make informed decisions regarding sales strategies and inventory.',
            style: AppTextStyles.subtitleStyle,
          ),
        ],
      ),
    );
  }

  Widget buildDialogPage3(String imagePath) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Image.asset(
            imagePath,
            width: 200,
          ),
          const SizedBox(height: 20),
          Text(
            "Membership",
            style: AppTextStyles.titleStyleBlack1,
          ),
          const SizedBox(height: 12),
          Text(
            textAlign: TextAlign.center,
            'Utilize the "Membership" feature to record customer information, such as names, addresses, and preferences. This helps provide enhances the overall customer experience.',
            style: AppTextStyles.subtitleStyle,
          ),
        ],
      ),
    );
  }
}
