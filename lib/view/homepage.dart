// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/authentication/loginpage.dart';
import 'package:pos_capstone/view/cart/cartitem.dart';
import 'package:pos_capstone/view/chip/model.dart';
import 'package:pos_capstone/view/dashboard.dart';
import 'package:pos_capstone/view/generatereportAi/generate_report.dart';
import 'package:pos_capstone/view/membership/membership_list.dart';
import 'package:pos_capstone/view/productsuggestion/product_suggestion.dart';
import 'package:pos_capstone/view/reportpage/report.dart';
import 'package:pos_capstone/viewmodel/view_model_login.dart';
import 'package:pos_capstone/viewmodel/view_model_product.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LoginVM loginViewmodel;

  final screen = [
    const DashboardPage(),
    const ReportPage(),
    const MembershipListPage(),
  ];

  late ProductProvider productProvider;

  final listChoices = <ItemChoice>[
    ItemChoice(1, 'Coffee', Icons.local_cafe_outlined),
    ItemChoice(2, 'Non Coffee', Icons.local_drink),
    ItemChoice(3, 'Meals', Icons.restaurant),
    ItemChoice(4, 'Snack', Icons.fastfood),
  ];
  var idSelected = 1;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  // @override
  // void initState() {
  //   productProvider = Provider.of<ProductProvider>(context, listen: false);
  //   loginViewmodel = Provider.of<LoginVM>(context, listen: false);
  //   productProvider.getProducts();
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return const GuideDialog();
  //       },
  //     );
  //   });
  // }

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
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    loginViewmodel = Provider.of<LoginVM>(context, listen: false);
    productProvider.getProducts();
    return Consumer<ProductProvider>(
      builder: (context, value, child) => Scaffold(
          key: _drawerKey,
          backgroundColor: ColorsCollection.WhiteNeutral,
          appBar: value.selectedIndex == 0
              ? AppBar(
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
                                        backgroundColor:
                                            ColorsCollection.unSelectedColor,
                                        backgroundImage: AssetImage(
                                            'images/aksaracoffe.png'),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(width: 12),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Good Morning',
                                          style:
                                              AppTextStyles.subtitleStyleBlack),
                                      Text('Hello, Aksara Coffee',
                                          style: AppTextStyles.titleStyleBlack),
                                    ])
                              ]),
                            ),
                            Consumer<ProductProvider>(
                              builder: (context, value, child) {
                                return Badge(
                                  alignment: Alignment.topRight,
                                  label:
                                      Text(value.cartItems.length.toString()),
                                  smallSize: 10,
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(
                                        minWidth: 24,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CartDetail()),
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
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: CustomPadding.kSidePadding,
                        child: TextField(
                          onChanged: (query) {
                            if (query.isNotEmpty) {
                              // Panggil metode pencarian di ViewModel
                              Provider.of<ProductProvider>(context,
                                      listen: false)
                                  .searchProduct(query,
                                      productProvider.productModel!.results);
                            } else {
                              Provider.of<ProductProvider>(context,
                                      listen: false)
                                  .clearSearch();
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: AppTextStyles.hintTextSearch,
                            isDense: true,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: ColorsCollection.GreyNeutral),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: ColorsCollection.GreyNeutral),
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
                        child: Consumer<ProductProvider>(
                          builder: (context, value, child) => ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              Wrap(
                                spacing: 12,
                                children: listChoices
                                    .map(
                                      (e) => ChoiceChip(
                                          labelStyle: TextStyle(
                                            color: value.pageIndex == e.id
                                                ? ColorsCollection.WhiteNeutral
                                                : ColorsCollection.GreyNeutral,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(40),
                                          ),
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          labelPadding:
                                              const EdgeInsets.only(left: 4),
                                          avatar: Icon(
                                            value.pageIndex == e.id
                                                ? e.avataricon
                                                : e.avataricon,
                                            color: value.pageIndex == e.id
                                                ? ColorsCollection.WhiteNeutral
                                                : ColorsCollection.GreyNeutral,
                                          ),
                                          selectedColor:
                                              ColorsCollection.PrimaryColor,
                                          backgroundColor:
                                              ColorsCollection.GreyNeutral02,
                                          label: Text(e.label),
                                          selected: value.pageIndex == e.id,
                                          onSelected: (_) =>
                                              value.setPage(e.id)),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : null,
          body: screen[value.selectedIndex],
          drawer: Drawer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/logocoklat.png',
                              width: 100,
                            ),
                            InkWell(
                              onTap: () =>
                                  productProvider.indexPage1(context, 0),
                              child: ListTile(
                                dense: true,
                                minLeadingWidth: 12,
                                leading: const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Icon(
                                      Icons.home,
                                      color: ColorsCollection.PrimaryColor,
                                    )),
                                title: Text('Home',
                                    style: AppTextStyles.goodMorning),
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  productProvider.indexPage1(context, 1),
                              child: ListTile(
                                dense: true,
                                minLeadingWidth: 12,
                                leading: const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Icon(
                                      Icons.leaderboard,
                                      color: ColorsCollection.PrimaryColor,
                                    )),
                                title: Text('Report',
                                    style: AppTextStyles.goodMorning),
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  productProvider.indexPage1(context, 0),
                              child: ListTile(
                                dense: true,
                                minLeadingWidth: 12,
                                leading: const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Icon(
                                      Icons.local_police,
                                      color: ColorsCollection.PrimaryColor,
                                    )),
                                title: Text('Membership',
                                    style: AppTextStyles.goodMorning),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ChatbotPage(),
                                    ));
                              },
                              child: ListTile(
                                dense: true,
                                minLeadingWidth: 12,
                                leading: const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Icon(
                                      Icons.thumb_up_outlined,
                                      color: ColorsCollection.PrimaryColor,
                                    )),
                                title: Text('Suggestion Product',
                                    style: AppTextStyles.goodMorning),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: ListTile(
                                dense: true,
                                minLeadingWidth: 12,
                                leading: const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Icon(
                                      Icons.help_outline,
                                      color: ColorsCollection.PrimaryColor,
                                    )),
                                title: Text('Manual Guide',
                                    style: AppTextStyles.goodMorning),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: ListTile(
                                dense: true,
                                minLeadingWidth: 12,
                                leading: const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Icon(
                                      Icons.account_circle,
                                      color: ColorsCollection.PrimaryColor,
                                    )),
                                title: Text('Call Admin',
                                    style: AppTextStyles.goodMorning),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: ListTile(
                                dense: true,
                                minLeadingWidth: 12,
                                leading: const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Icon(
                                      Icons.report_outlined,
                                      color: ColorsCollection.PrimaryColor,
                                    )),
                                title: Text('Privacy Policy',
                                    style: AppTextStyles.goodMorning),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: ListTile(
                                dense: true,
                                minLeadingWidth: 12,
                                leading: const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Icon(
                                      Icons.star_outline,
                                      color: ColorsCollection.PrimaryColor,
                                    )),
                                title: Text('Give A Rating',
                                    style: AppTextStyles.goodMorning),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReportScreen(),
                                    ));
                              },
                              child: ListTile(
                                dense: true,
                                minLeadingWidth: 12,
                                leading: const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Icon(
                                      Icons.file_copy_outlined,
                                      color: ColorsCollection.PrimaryColor,
                                    )),
                                title: Text('Generate Report',
                                    style: AppTextStyles.goodMorning),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                loginViewmodel.logindata
                                    .setBool('loginCurrent', true);
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                    (route) => false);
                              },
                              child: ListTile(
                                dense: true,
                                minLeadingWidth: 12,
                                leading: const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Icon(
                                      Icons.logout,
                                      color: ColorsCollection.PrimaryColor,
                                    )),
                                title: Text('Logout',
                                    style: AppTextStyles.goodMorning),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  color: ColorsCollection.PrimaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: ColorsCollection.unSelectedColor,
                          backgroundImage: AssetImage('images/aksaracoffe.png'),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Aksara Coffee',
                                style: AppTextStyles.titleStyleWhite,
                              ),
                              Consumer<LoginVM>(
                                builder: (context, LoginVM, _) {
                                  LoginVM.checkSharedPreferences();
                                  final username =
                                      LoginVM.usernameSharedPreference;
                                  print(username);
                                  return Text(
                                    username.isNotEmpty ? username : 'Guest',
                                    style: AppTextStyles.subtitleStyleWhite,
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
              height: 58,
              child: Consumer<ProductProvider>(
                builder: (context, value, child) => ClipRRect(
                  child: BottomNavigationBar(
                    selectedLabelStyle: AppTextStyles.labelStyleButton,
                    unselectedLabelStyle: AppTextStyles.labelStyleButton,
                    selectedFontSize: 10,
                    backgroundColor: ColorsCollection.PrimaryColor,
                    unselectedFontSize: 10,
                    currentIndex: value.selectedIndex,
                    onTap: (value) => productProvider.onItemTapped(value),
                    selectedItemColor: ColorsCollection.WhiteNeutral,
                    unselectedItemColor: ColorsCollection.unSelectedColor,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.local_cafe, size: 24),
                          label: 'Product'),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.leaderboard_outlined, size: 24),
                        label: 'Report',
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.local_police_outlined, size: 24),
                          label: 'Member'),
                    ],
                  ),
                ),
              ))),
    );
  }

  void printUserData() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    // Cetak data yang seharusnya tidak ada setelah logout
    print('Token setelah logout: $token');
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
