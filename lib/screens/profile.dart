
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0Xff019E8B),
        title: Text(
            'Profile',
        style: GoogleFonts.acme(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
        actions: [
          SizedBox(
            width: 70,
            height: 20,
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/editProfile_screen');
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0Xff019E8B),
                elevation: 0
              ), child: Text(
              'Edit',
              style: GoogleFonts.aBeeZee(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),

            ),
            ),
          )
        ],
        elevation: 0,
      ),



      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ClipOval(
              child: Image.asset('assets/images/photo.png' ),
            ),
          ),

          ListTile(

            leading: const Icon(
                Icons.person_outline,color: Colors.grey,size: 30
            ),
            trailing: Text(
              'Hicats Sam',
              style: GoogleFonts.aBeeZee(
                fontSize: 17,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,),
            child: Divider(thickness: 1,color: Colors.grey),
          ),
          ListTile(

            leading: const Icon(Icons.phone_enabled_outlined,color: Colors.grey,size: 30,),
            trailing: Text(
              '+972569896990',
              style: GoogleFonts.aBeeZee(
                fontSize: 17,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,),
            child: Divider(thickness: 1,color: Colors.grey),
          ),
          ListTile(

            leading: const Icon(Icons.transgender,color: Colors.grey,size: 30,),
            trailing: Text(
              'Female',
              style: GoogleFonts.aBeeZee(
                fontSize: 17,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,),
            child: Divider(thickness: 1,color: Colors.grey),
          ),
          ListTile(

            leading: const Icon(Icons.date_range,color: Colors.grey,size: 30,),
            trailing: Text(
              '15/09/2003',
              style: GoogleFonts.aBeeZee(
                fontSize: 17,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,),
            child: Divider(thickness: 1,color: Colors.grey),
          ),

          ListTile(

            leading: const Icon(Icons.location_city_outlined,color: Colors.grey,size: 30,),
            trailing: Text(
              'palestine-Gaza-Alrasheed',
              style: GoogleFonts.aBeeZee(
                fontSize: 17,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,),
            child: Divider(thickness: 1,color: Colors.grey),
          ),
    ],
      ),
    );
  }
}
