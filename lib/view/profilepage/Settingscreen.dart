import 'package:flutter/material.dart';

import 'package:medi_go/view/customsettings/Customsettings.dart';
import 'package:medi_go/view/customsettings/Settingstile.dart';
import 'package:medi_go/view/switch/MySwitch.dart';

class Settingscreen extends StatelessWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
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
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Color(0xffe7e7e7),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 70,
                    top: 80,
                    child: Text(
                      'Settings and Credentials',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffe7e7e7),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Customsettings(
                    icon: Icon(Icons.security, color: Colors.teal),
                    first: 'Account Security',
                    widget: Column(
                      children: [
                        Settingstile(
                          icon: Icon(Icons.key, color: Colors.teal),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.teal,
                          ),
                          title: 'Change Password',
                          subtitle: 'Last updated 3 months ago',
                          circlecolor: Color(0xffcfe6f2),
                        ),
                        Divider(thickness: 1),
                        Settingstile(
                          icon: Icon(Icons.fingerprint, color: Colors.teal),
                          trailing: MySwitch(),
                          title: 'Biometric Unlock',
                          subtitle: 'Face ID or Touch ID enabled',
                          circlecolor: Color(0xffcfe6f2),
                        ),
                        Divider(thickness: 1),
                        Settingstile(
                          icon: Icon(Icons.add),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.teal,
                          ),
                          title: 'Two-Factor Authentication',
                          subtitle: 'Highly recommended for clinical\n safety',
                          circlecolor: Color(0xffcfe6f2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  Customsettings(
                    icon: Icon(
                      Icons.notifications_on_outlined,
                      color: Colors.teal,
                    ),
                    first: 'Notfications preferences',
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Settingstile(
                          trailing: MySwitch(),
                          title: 'Appointment Alerts',
                          subtitle:
                              'Receive timely updates\nabout your\nnext appointment.',
                          circlecolor: Color(0xffcfe6f2),
                        ),
                        Divider(thickness: 1),
                        Settingstile(
                          trailing: MySwitch(),
                          title: 'Lab Results',
                          subtitle:
                              'Notify when new diagnostic\nresults are available',
                          circlecolor: Color(0xffcfe6f2),
                        ),
                        Divider(thickness: 1),
                        Settingstile(
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.teal,
                          ),
                          title: 'App Updates',
                          subtitle:
                              'New feature announcements and\nplatform news',
                        ),
                        // Divider(thickness: 1),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Customsettings(
                    icon: Icon(Icons.dataset_rounded, color: Colors.teal),
                    first: 'Privacy & Data',
                    widget: Column(
                      children: [
                        Settingstile(
                          icon: Icon(Icons.timer, color: Colors.teal),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.teal,
                          ),
                          title: 'Anomyized Data Sharing',
                          subtitle: 'Contribute to clinical research \nstudies',
                          circlecolor: Color(0xffcfe6f2),
                        ),
                        Divider(thickness: 1),
                        Settingstile(
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.teal,
                          ),
                          title: 'Activity Log',
                          subtitle:
                              'View all security-related account\n actions',
                          circlecolor: Color(0xffcfe6f2),
                          icon: Icon(Icons.timer, color: Colors.teal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Customsettings(
                    icon: Icon(Icons.logout, color: Colors.teal),
                    first: 'Account Actions',
                    widget: Column(
                      children: [
                        Settingstile(
                          icon: Icon(Icons.person_add, color: Colors.teal),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.teal,
                          ),
                          title: 'Sign in with another account',
                          subtitle: 'Switch to a different clinical\n profile',
                          circlecolor: Color(0xffcfe6f2),
                        ),
                        Divider(thickness: 1),
                        Settingstile(
                          icon: Icon(Icons.logout, color: Colors.red),
                          trailing: MySwitch(),
                          title: 'Logout',
                          subtitle: 'Securely sign out of your account',
                          circlecolor: Color.fromRGBO(186, 26, 26, 0.1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
