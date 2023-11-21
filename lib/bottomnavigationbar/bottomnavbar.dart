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
        height: 58,
        child: ClipRRect(
          child: BottomNavigationBar(
            selectedFontSize: 10,
            backgroundColor: ColorsCollection.PrimaryColor,
            unselectedFontSize: 10,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: ColorsCollection.WhiteNeutral,
            unselectedItemColor: ColorsCollection.unSelectedColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.local_cafe, size: 20),
                  ),
                  label: 'Product'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.leaderboard_outlined, size: 20),
                  ),
                  label: 'Order'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.local_police_outlined, size: 20),
                  ),
                  label: 'Member'),
            ],
          ),
        ),
      ),
    );
  }
}
