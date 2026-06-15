import 'package:flutter/material.dart';

import 'package:medi_go/view/Dashboardscreen/dashboardscreen.dart';
import 'package:medi_go/view/appointment/Appointmentpage.dart';
import 'package:medi_go/view/categorypage/Categorypage.dart';
import 'package:medi_go/view/profilepage/Profilepage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex = 0;
  final List<Widget> screens = [
    Dashboardscreen(),
    Categorypage(),
    Appointmentpage(),
    Profilepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedindex,
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: '',
          ),
        ],
      ),
    );
  }
}
