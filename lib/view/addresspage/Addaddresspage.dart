import 'package:flutter/material.dart';
import 'package:medi_go/view/customaddresstextfield/Customaddresstextfield.dart';
import 'package:medi_go/view/homepage/Homepage.dart';

class Addaddresspage extends StatefulWidget {
  const Addaddresspage({super.key});

  @override
  State<Addaddresspage> createState() => _AddaddresspageState();
}

class _AddaddresspageState extends State<Addaddresspage> {
  String? city;
  String? country;
  bool isDefaultAddress = true;
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
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Color(0xffe7e7e7),
                    ),
                  ),
                  Positioned(
                    left: 65,
                    top: 80,
                    child: Text(
                      'Add Address',
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add  a new address',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Customaddresstextfield(
              title: 'Country/Region',

              isDropdown: true,
              items: const ['Delhi', 'Noida', 'Ghaziabad'],
              value: country,
              onChanged: (value) {
                setState(() {
                  country = value;
                });
              },
            ),

            Customaddresstextfield(
              title: 'Full name (First and Last name)',
              widget: Icon(Icons.close),
              text: 'John',
            ),
            Customaddresstextfield(
              title: 'Mobile number',
              widget: Icon(Icons.close),
              text: '0123456',
            ),
            Customaddresstextfield(
              title: 'Flat, House no., Building, Company, Apartment',
            ),
            Customaddresstextfield(title: 'Area, Street, Sector, Village'),
            Customaddresstextfield(
              title: 'Landmark',

              text: 'e.g. near apollo hospital',
            ),
            Row(
              children: [
                Expanded(
                  child: Customaddresstextfield(
                    title: 'Pincode',
                    text: '6-digit Pincode',
                  ),
                ),
                Expanded(child: Customaddresstextfield(title: 'Town/City')),
              ],
            ),
            // Customaddresstextfield(
            //   title: 'State',

            //   isDropdown: true,
            //   items: const ['UP', 'Mumbai', 'Haryana'],
            //   value: city,
            //   onChanged: (value) {
            //     setState(() {
            //       city = value;
            //     });
            //   },
            // ),
            CheckboxListTile(
              value: isDefaultAddress,
              activeColor: Colors.teal,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Make this my default address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onChanged: (value) {
                setState(() {
                  isDefaultAddress = value ?? false;
                });
              },
            ),

            const Divider(height: 1),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Delivery instructions (optional)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  'Notes, preferences and more',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  // Navigate or open bottom sheet
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F8894),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    "Add Address",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
