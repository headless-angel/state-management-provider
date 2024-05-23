import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nic_test/home/grievance.dart';
import 'package:nic_test/home/home.dart';
import 'package:nic_test/home/services.dart';
import 'package:nic_test/home/track.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final List<Widget> screens = [
    const MyHomePage(
      title: 'Home',
    ),
    const TrackPage(),
    const GrievancePage(),
    const ServicesPage(),
  ];

  int _selectedIndex = 0;
  bool _doubleBackPress = false;

  void selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_doubleBackPress) {
          SystemNavigator.pop();
        } else {
          _doubleBackPress = true;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Press back again to exit'),
            ),
          );
          Timer(Duration(seconds: 2), () {
            _doubleBackPress = false;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomNavigationBar(
              //selectedItemColor: AppColors.colorAccent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
              onTap: selectPage,
              currentIndex: _selectedIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: 'Track',
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Icons.account_balance_wallet_outlined),
                    ],
                  ),
                  label: 'Grienance',
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Icons.account_balance_wallet_outlined),
                    ],
                  ),
                  label: 'Services',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
