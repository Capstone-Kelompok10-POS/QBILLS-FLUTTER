import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/view/homepage.dart';
import 'package:pos_capstone/view/report.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final screen = [
    const HomePage(),
    const TeSTING(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 74,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomNavigationBar(
            selectedFontSize: 14,
            backgroundColor: ColorsCollection.PrimaryColor,
            unselectedFontSize: 14,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: ColorsCollection.WhiteNeutral,
            unselectedItemColor: ColorsCollection.unSelectedColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_cafe), label: 'Produk'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard_outlined), label: 'Report'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_police_outlined), label: 'Membership'),
            ],
          ),
        ),
      ),
    );
  }
}
