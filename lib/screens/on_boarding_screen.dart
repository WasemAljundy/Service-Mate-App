
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/boarding_model.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:gp_106_flutter_project/widgets/on_boarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var _pageController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'images/boarding.png',
      title: 'Welcome to our Online Reservation App!',
      body: 'Explore a wide range of options and book your favorite services with ease.',
    ),
    BoardingModel(
      image: 'images/boarding11.png',
      title: 'Easy Booking Process',
      body: 'Find your desired service quickly and book it in a few simple steps.',
    ),
    BoardingModel(
      image: 'images/boarding.png',
      title: 'Efficient Management',
      body: 'Streamline your reservation process and efficiently manage your bookings.',
    ),
  ];

  bool isLast = false;
  int _currentPage = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
        Visibility(
            replacement: Align(
                alignment: AlignmentDirectional.topEnd,
                child:
                TextButton(onPressed: () {
                  saveAndPush();
                  }, child:  Text('Start  ',style: TextStyle(fontSize: 20,color: primaryColors),))),
            visible: _currentPage < 2,
            child: Align(
                alignment: AlignmentDirectional.topEnd,
                child:
                TextButton(onPressed: () {
                  _pageController.animateToPage(2, duration: const Duration(seconds: 1), curve: Curves.easeIn);
                }, child:  Text('Skip  ',style: TextStyle(fontSize: 20,color: primaryColors),)))),
      ],),
      body: Column(
        children: [
          const SizedBox(height: 50,),
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) =>
                  OnBoardingWidget(model: boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  effect:  ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                    activeDotColor: primaryColors
                  ),
                  count: boarding.length,

                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (_currentPage == 2)
                    {
                      saveAndPush();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  backgroundColor: primaryColors,
                )

              ],
            ),
          ),
        ],
      ),

    );
  }

  void saveAndPush() async {
    await SharedPrefController().saveBoarding();
    Navigator.pushReplacementNamed(context, '/login_screen');
  }


}

