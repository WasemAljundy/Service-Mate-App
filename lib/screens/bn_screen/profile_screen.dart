
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/edit_profile_screen.dart';
import 'package:hexcolor/hexcolor.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

   final String? _fullName = "Hicats Sam";
   final String _email = "hicats@gmial.com";
   final String _mobile = "0569896990";
   final String _birthDay = '15/09/2003';
   final String _gender = 'Male';
   final String _address = 'palestine-Gaza';


class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:HexColor('#4B989C'),
        elevation: 0,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: ListView(

        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            SizedBox(
              width: 120,
              height: 120,
              child: ClipOval(
                child: Image.asset('images/photo.png' ),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: 80,
              height: 32,
              child: ElevatedButton(onPressed: (){
                _getData();
                // Navigator.pushNamed(context, '/editProfile_screen');
              },
                style: ElevatedButton.styleFrom(
                    backgroundColor:const Color(0Xff4B989C),
                    elevation: 0
                ), child: const Text(
                  'Edit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),

                ),
              ),
            ),

            ListTile(
              leading: const Icon(
                  Icons.person_outline,color: Colors.grey,size: 30
              ),
              trailing: Text(
                _fullName!,
                style: GoogleFonts.acme(
                  fontSize: 17,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,),
              child: Divider(thickness: 1,color: Colors.grey),
            ),
            ListTile(

              leading: const Icon(Icons.email_outlined,color: Colors.grey,size: 30,),
              trailing: Text(
                _email,
                style: GoogleFonts.acme(
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
                _mobile,
                style: GoogleFonts.acme(
                  fontSize: 17,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,),
              child: Divider(thickness: 1,color: Colors.grey),
            ),
            ListTile(

              leading: const Icon(Icons.transgender_outlined,color: Colors.grey,size: 30,),
              trailing: Text(
                _gender,
                style: GoogleFonts.acme(
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
                _birthDay,
                style: GoogleFonts.acme(
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
                _address,
                style: GoogleFonts.acme(
                  fontSize: 17,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,),
              child: Divider(thickness: 1,color: Colors.grey),
            ),

          ],
        ),],

      ),
    );
  }

  void _getData(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditProfileScreen(fullName: _fullName,address: _address,birthDay: _birthDay,gender: _gender,mobile: _mobile,),)
    );
  }
}
