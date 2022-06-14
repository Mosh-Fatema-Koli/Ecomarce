import 'dart:io';

import 'package:ecomarce_interface/auth/login_page.dart';
import 'package:ecomarce_interface/auth/registation.dart';
import 'package:ecomarce_interface/screen/account.dart';
import 'package:ecomarce_interface/screen/home.dart';
import 'package:ecomarce_interface/screen/hot_offer.dart';
import 'package:ecomarce_interface/screen/location.dart';
import 'package:ecomarce_interface/screen/menu.dart';
import 'package:ecomarce_interface/widget/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    OfferPage(),
    AccountPage(),
    LocationPage(),
    MenuPage(),
    LoginPage(),
    RegistationPage()
  ];

  onBackPressed() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0)),
            title: Text(
              "Are You Sure ?",
              style: myStyle(16, Colors.white, FontWeight.w500),
            ),
            content: Text("You are going to exit the app !"),
            titlePadding:
                EdgeInsets.only(top: 30, bottom: 12, right: 30, left: 30),
            contentPadding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            backgroundColor: BrandColors.colorPrimaryDark,
            contentTextStyle: myStyle(
                14, BrandColors.colorText.withOpacity(0.7), FontWeight.w400),
            titleTextStyle: myStyle(18, Colors.white, FontWeight.w500),
            actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            actions: <Widget>[
              MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "No",
                    style: myStyle(14, BrandColors.colorText),
                  )),
              MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: BrandColors.colorPurple,
                child: Text(
                  'Yes',
                  style: myStyle(14, Colors.white, FontWeight.w500),
                ),
                onPressed: () {
                  exit(0);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.red,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mosh. Fatema Akhter Koli",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Email: fatemakoli58@gmail.com",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Phone No: 01302607702",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        actions: [
          Icon(
            Icons.call,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          return onBackPressed();
        },
        child: Container(child: pages[currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Hot Offers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Location",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
        ],
      ),
    );
  }
}
