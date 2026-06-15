import 'package:flutter/material.dart';
import 'package:medi_go/view/customcategory/Customcategory.dart';

class Categorypage extends StatelessWidget {
  const Categorypage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 180,
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
                  left: 50,
                  top: 80,
                  child: Text(
                    'Find Doctors by Speciality',
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
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search by Specialities",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                prefixIcon: const Icon(Icons.search, color: Colors.black54),
                // filled: true,
                // fillColor: const Color(0xFFEEEEEE),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              children: [
                Customcategory(
                  text: 'Psychiatrist',
                  subtext: '15+ Doctors/Hospitals \nNearby',
                  image: Image.asset('assets/images/cat1.png'),
                ),
                Customcategory(
                  text: 'Dermatologist',
                  subtext: '15+ Doctors/Hospitals \nNearby',
                  image: Image.asset('assets/images/cat2.png', height: 50),
                ),
                Customcategory(
                  text: 'Gynaecologist',
                  subtext: '15+ Doctors/Hospitals \nNearby',
                  image: Image.asset('assets/images/cat3.png'),
                ),
                Customcategory(
                  text: 'Orthopedist',
                  subtext: '15+ Doctors/Hospitals \nNearby',
                  image: Image.asset('assets/images/cat4.png'),
                ),
                Customcategory(
                  text: 'Cardiologist',
                  subtext: '15+ Doctors/Hospitals \nNearby',
                  image: Image.asset('assets/images/cat5.png'),
                ),
                Customcategory(
                  text: 'Dentist',
                  subtext: '15+ Doctors/Hospitals \nNearby',
                  image: Image.asset('assets/images/cat6.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
