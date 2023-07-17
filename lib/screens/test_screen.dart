

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens_keys.dart';

class textScreen extends StatelessWidget {
      const textScreen({super.key});

      @override
      Widget build(BuildContext context) {
        return  Scaffold(
          appBar: AppBar(
            title: Text("Test"),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(child: Text("ChangePasswordScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.changePasswordScreen);
                    }),
                TextButton(child: Text("LoginScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.loginScreen);
                    }),
                TextButton(child: Text("RegisterScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.registerScreen);
                    }),
                TextButton(child: Text("AddAddressScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.addAddressScreen);
                    }),
                TextButton(child: Text("AddDataScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.addDataScreen);
                    }),
                TextButton(child: Text("AddRateQuestionsScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.addRateQuestionsScreen);
                    }),
                TextButton(child: Text("DataKeysScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.dataKeysScreen);
                    }),
                TextButton(child: Text("ChangePasswordScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.changePasswordScreen);
                    }),
                TextButton(child: Text("FavoriteScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.favoriteScreen);
                    }),
                TextButton(child: Text("HomeScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.homeScreen);
                    }),
                TextButton(child: Text("OrderScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.orderScreen);
                    }),
                TextButton(child: Text("ProfileScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.profileScreen);
                    }),
                TextButton(child: Text("UpdateAddressScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.updateAddressScreen);
                    }),
                TextButton(child: Text("UpdateDataKeysScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.updateDataKeysScreen);
                    }),
                TextButton(child: Text("UpdateDataScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.updateDataScreen);
                    }),
                TextButton(child: Text("AddExperiencesScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.addExperiencesScreen);
                    }),
                TextButton(child: Text("ShowExperiences"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.showExperiencesScreen);
                    }),
                TextButton(child: Text("UpdateExperiencesScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.updateExperiencesScreen);
                    }),
                TextButton(child: Text("FaqDetailsScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.faqDetailsScreen);
                    }),
                TextButton(child: Text("FaqScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.faqScreen);
                    }),
                TextButton(child: Text("ArticlesScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.articlesScreen);
                    }),
                TextButton(child: Text("ReservationsScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.reservationsScreen);
                    }),
                TextButton(child: Text("ServiceDetailsScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.serviceDetailsScreen);
                    }),
                TextButton(child: Text("ServiceWorkTime"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.serviceWorkTimeScreen);
                    }),
                TextButton(child: Text("ServiceScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.serviceScreen);
                    }),
                TextButton(child: Text("AddAttachmentScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.addAttachmentScreen);
                    }),
                TextButton(child: Text("ArticlesDetailsScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.articlesDetailsScreen);
                    }),
                TextButton(child: Text("AttachmentDetailsScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.attachmentDetailsScreen);
                    }),
                TextButton(child: Text("AttachmentsScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.attachmentsScreen);
                    }),
                TextButton(child: Text("BillScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.billScreen);
                    }),
                TextButton(child: Text("CategoryScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.categoryScreen);
                    }),
                // TextButton(child: Text("ContactUsScreen"),
                //     onPressed: (){Navigator.pushNamed(context, ScreenKeys.contactUsScreen);
                //     }),
                TextButton(child: Text("AttachmentsScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.attachmentsScreen);
                    }),
                TextButton(child: Text("LaunchScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.launchScreen);
                    }),
                TextButton(child: Text("MainScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.mainScreen);
                    }),
                TextButton(child: Text("OnBoardingScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.onBoardingScreen);
                    }),
                TextButton(child: Text("PaymentMethodScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.paymentMethodScreen);
                    }),
                TextButton(child: Text("TapBarArticlesScreen"),
                    onPressed: (){Navigator.pushNamed(context, ScreenKeys.tapBarArticlesScreen);
                    }),

              ],
            ),
          ),
        );
      }
    }
