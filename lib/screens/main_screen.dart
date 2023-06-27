import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/favorite_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/home_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/order_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/profile_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> bottomScreens = [
    HomeScreen(),
    OrderScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  List<String> titleLists = [
    'Home',
    'My Order',
    'Favorite',
    'Profile',
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#4B989C'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_important),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        title: Text(titleLists[_currentIndex]),
        centerTitle: true,
      ),
      body: bottomScreens[_currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.10),
              spreadRadius: 3,
              blurRadius: 150,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              currentIndex: _currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: 'Home',
                  activeIcon: Icon(
                    Icons.home,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  activeIcon: Icon(Icons.shopping_cart),
                  label: 'My order',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                  ),
                  activeIcon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                  ),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              elevation: 0,
              selectedItemColor: primaryColors,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
            ),
          ],
        ),
      ),
    );
  }
}
