import 'package:dockd/Settings.dart';
import 'package:dockd/Vehicles.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

class MyNav extends StatefulWidget {
  const MyNav({super.key});
  @override
  State<MyNav> createState() => _MyNavState();
}

class _MyNavState extends State<MyNav> {
  final Color Carbon = Color.fromARGB(255, 58, 54, 54);
  int pageIndex = 0;
  List<Widget> PageList = <Widget>[Home(), VehiclePage(), SettingsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Carbon,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_crash), label: 'Vehicles'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
