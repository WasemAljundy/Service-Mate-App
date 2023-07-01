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
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 170,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    HexColor('#4B95A2'),
                    HexColor('#50A58E'),
                  ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd)),
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    clipBehavior: Clip.antiAlias,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        border: Border.all(color: Colors.white, width: 3)),
                    child: ClipOval(
                        child: Image.asset(
                      'images/test.jpg',
                      fit: BoxFit.cover,
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Anas Alsafadi',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        ),
                        Text(
                          'anasA2@gmail.com',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/categories_screen'),
              title: const Text('Categories'),
              subtitle: const Text('the details about category'),
              leading: const Icon(Icons.query_builder),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/profile_screen'),
              title: const Text('Profile'),
              subtitle: const Text('the details about profile'),
              leading: const Icon(Icons.person_pin),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/faqs_screen'),
              title: const Text('FAQs'),
              subtitle: const Text('the details about FAQs'),
              leading: const Icon(Icons.question_answer),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/articles_screen'),
              title: const Text('Articles'),
              subtitle: const Text('the details about Articles'),
              leading: const Icon(Icons.article),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/'),
              title: const Text('My Order'),
              subtitle: const Text('the details about my order'),
              leading: const Icon(Icons.shopping_cart_outlined),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            const Divider(
              endIndent: 20,
              indent: 20,
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              title: const Text('Contact Us'),
              subtitle: const Text('Get Support and Inquiries'),
              leading: const Icon(Icons.contact_support),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login_screen', (route) => false);
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
