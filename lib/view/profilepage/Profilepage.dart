import 'package:flutter/material.dart';
import 'package:medi_go/view/customprofile/Customprofile.dart';
import 'package:medi_go/view/customprofile/Customsecondprofile.dart';
import 'package:medi_go/view/profilepage/Contactscreen.dart';
import 'package:medi_go/view/profilepage/Personalscreen.dart';
import 'package:medi_go/view/profilepage/Settingscreen.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 280,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Teal Header Background
                Container(
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0F8894),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 80,
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Color(0xffe7e7e7),
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 80,
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffe7e7e7),
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 193,

                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.asset(
                            'assets/images/goku.jpg',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('ID: MG-78-dhr '),
                            SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            Text('Status:'),
                            Text(
                              'Verified',
                              style: TextStyle(color: Colors.lightGreen),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
          Customprofile(
            text: 'Personal Info',
            onTaps: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Personalscreen()),
              );
            },
          ),
          Customprofile(
            text: 'Contact',
            onTaps: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contactscreen()),
              );
            },
          ),
          Customprofile(
            text: 'Settings',
            onTaps: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settingscreen()),
              );
            },
          ),
          Customprofile(
            text: 'Medical Records',
            onTaps: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            isselected: isSelected,
          ),
          if (isSelected)
            Column(
              children: [
                Customsecondprofile(
                  image: Image.asset(
                    'assets/images/cust.png',
                    height: 40,
                    width: 40,
                  ),
                  first: 'Appointment Letter',
                  second: 'Apolo Hospital',
                ),
                Customsecondprofile(
                  image: Image.asset(
                    'assets/images/paths.png',
                    height: 40,
                    width: 40,
                  ),
                  first: 'Check-Up Report',
                  second: 'Path Kind Labs',
                ),
                Customsecondprofile(
                  image: Image.asset(
                    'assets/images/paths.png',
                    height: 40,
                    width: 40,
                  ),
                  first: 'Referral Later',
                  second: 'Apolo Hospital',
                ),
                Customsecondprofile(
                  image: Image.asset(
                    'assets/images/paths.png',
                    height: 40,
                    width: 40,
                  ),
                  first: 'Referral Later',
                  second: 'Apolo Hospital',
                ),
                Customsecondprofile(
                  image: Image.asset(
                    'assets/images/india.png',
                    height: 40,
                    width: 40,
                  ),
                  first: 'Referral Later',
                  second: 'Batra Clinic',
                ),
              ],
            ),
        ],
      ),
    );
  }
}
