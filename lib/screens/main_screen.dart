import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp_106_flutter_project/api/controllers/auth_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/getx/profile_getx_controller.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/favorite_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/home_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/order_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/profile_screen.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';
import 'package:hexcolor/hexcolor.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> bottomScreens = [
    HomeScreen(),
    const OrderScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  List<String> titleLists = [
    'Home',
    'My Order',
    'Favorite',
    'Profile',
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    Get.put(ProfileGetxController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColors,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: () => logout(context),
          ),
        ],
        title: Text(titleLists[_currentIndex]),
        centerTitle: true,
      ),
      body: bottomScreens[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.10),
              spreadRadius: 3,
              blurRadius: 150,
              offset: const Offset(0, 3),
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
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 15, top: 50, right: 15, bottom: 20),
              height: 170,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    HexColor('#4B95A2'),
                    HexColor('#50A58E'),
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    clipBehavior: Clip.antiAlias,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'images/test.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          SharedPrefController().fullName,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          SharedPrefController().email,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () =>
                  Navigator.popAndPushNamed(context, ScreenKeys.serviceScreen),
              title: const Text('Services'),
              subtitle: const Text('the details about services'),
              leading: const Icon(
                Icons.query_builder_sharp,
                size: 30,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () =>
                  Navigator.popAndPushNamed(context, ScreenKeys.updateProfileScreen),
              title: const Text('Update Profile'),
              subtitle: const Text('change your profile details'),
              leading: const Icon(
                Icons.person_pin_sharp,
                size: 30,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () => Navigator.popAndPushNamed(context, ScreenKeys.faqScreen),
              title: const Text('FAQs'),
              subtitle: const Text('the details about FAQs'),
              leading: const Icon(
                Icons.question_answer,
                size: 30,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () =>
                  Navigator.popAndPushNamed(context, ScreenKeys.articlesScreen),
              title: const Text('Articles'),
              subtitle: const Text('the details about Articles'),
              leading: const Icon(
                Icons.article,
                size: 30,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () => Navigator.popAndPushNamed(context, ScreenKeys.orderScreen),
              title: const Text('My Order'),
              subtitle: const Text('the details about my order'),
              leading: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
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
                Navigator.pushNamed(context, ScreenKeys.contactUsScreen);
              },
              title: const Text('Contact Us'),
              subtitle: const Text('Get Support and Inquiries'),
              leading: const Icon(
                Icons.contact_support,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout(context);
    if (loggedOut && context.mounted) {
      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(
          context, ScreenKeys.loginScreen, (route) => false);
    }
  }
}
