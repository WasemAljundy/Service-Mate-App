import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/favorite_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/home_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/order_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/profile_screen.dart';

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
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            color: Colors.black,
            onPressed: () {
            },
          ),
        ],
      ),
      body:bottomScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(
              Icons.shopping_cart_outlined
            ),
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
        type: BottomNavigationBarType.fixed,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName:  Text('Anas Alsafadi'),
              accountEmail: Text('anas@gmail.com'),
              currentAccountPicture: CircleAvatar(),
              currentAccountPictureSize: Size(80, 80),
              otherAccountsPictures:  [
                CircleAvatar(),
                CircleAvatar(),
                CircleAvatar(),
              ],
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  gradient:LinearGradient(
                    colors:[
                      Colors.blue,
                      Colors.black87
                    ],
                  )
              ),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/info_screen'),
              title: const Text('Info'),
              subtitle: const Text('the details about info'),
              leading: const Icon(Icons.info),
              trailing: const Icon(Icons.arrow_forward_ios,size: 18,),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/faqs_screen'),
              title: const Text('FAQs'),
              subtitle: const Text('the details about FAQs'),
              leading: const Icon(Icons.question_answer),
              trailing: const Icon(Icons.arrow_forward_ios,size: 18,),
            ),
            const Divider(endIndent: 20,indent: 20,color: Colors.grey,),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/login_screen', (route) => false);

              },
              title: const Text('Logout'),
              subtitle: const Text('Waiting your return'),
              leading: const Icon(Icons.logout),
            )
          ],
        ),
      ),

    );
  }
}
