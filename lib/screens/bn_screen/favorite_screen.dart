import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/screens/fv_tab_bar_screen/show_articles.dart';

import '../../reservations/reservations_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)
            ),// لون خلفية التاب البار
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'Reservation',
                ),Tab(
                  text: 'Articles',
                )
              ],
              unselectedLabelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),
              labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              automaticIndicatorColorAdjustment: true,
              indicator: BoxDecoration(
                  color: primaryColors,
                  borderRadius: BorderRadius.circular(20)
              ),
              unselectedLabelColor: primaryColors,
            ),
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ReservationsScreen(),
              ArticlesScreen(),
            ],
          ),
        )
      ],
    );
  }
}
