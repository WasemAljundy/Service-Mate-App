import 'package:flutter/material.dart';
import '../../constent.dart';
import '../update_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColors,
      body: Column(
        children: [
          Container(
            color: primaryColors,
            height: 20,
          ),
          Expanded(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 50),
                    padding: const EdgeInsetsDirectional.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20),
                      ),
                    ),
                    width: double.infinity,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Anas Ashraf Alsafadi',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: primaryColors,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const ListTile(
                          contentPadding: EdgeInsetsDirectional.zero,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email address',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          subtitle: Text(
                            'Anas12Alsafadi@gmail.com',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.email),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ListTile(
                          contentPadding: EdgeInsetsDirectional.zero,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          subtitle: Text(
                            'male',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.male),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ListTile(
                          contentPadding: EdgeInsetsDirectional.zero,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone Number',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          subtitle: Text(
                            '+972 592204656',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.phone),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ListTile(
                          contentPadding: EdgeInsetsDirectional.zero,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Birth data',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          subtitle: Text(
                            'June 24 1989',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.date_range),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'images/photo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}