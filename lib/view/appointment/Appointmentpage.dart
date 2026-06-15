import 'package:flutter/material.dart';
import 'package:medi_go/view/customappoint/CustomAppointments.dart';

class Appointmentpage extends StatefulWidget {
  const Appointmentpage({super.key});

  @override
  State<Appointmentpage> createState() => _AppointmentpageState();
}

class _AppointmentpageState extends State<Appointmentpage> {
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
                    'Appointments',
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
                hintText: "Search Appointments",
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
          SizedBox(height: 20),
          Customappointments(
            tags: 'Upcoming',
            first: 'Apolo Labs',
            second: 'Dr. Anil Kumar',
            time: 'Tommorow 1PM,\n in 14 hrs ago',
            check: 'Complete Blood\n Checkup',
            buttons: 'Schedule',
            colors: Color(0xfff0e544),
            image: Image.asset('assets/images/cust.png'),
            color: Colors.black,
          ),
          SizedBox(height: 20),
          Customappointments(
            tags: 'Completed',
            first: 'Apolo Labs',
            second: 'Dr. Anil Kumar',
            time: 'Yesterday\n in 14 hrs ago',
            check: 'Annual Checkup',
            buttons: 'View Report',
            colors: Color(0xff16964E),
            image: Image.asset('assets/images/cust.png'),
            color: Colors.white,
          ),
          SizedBox(height: 20),
          Customappointments(
            tags: 'Completed',
            first: 'Pathkind Labs',
            second: 'Surendra Nayak',
            time: '10 days ago\n15/03/2026',
            check: 'Blood Sugar Check\nup',
            buttons: 'View Report',
            colors: Color(0xff16964E),
            image: Image.asset('assets/images/cust.png'),
            color: Colors.white,
          ),
          SizedBox(height: 20),
          Customappointments(
            tags: 'Completed',
            first: 'Apolo Labs',
            second: 'Dr Anil Kumar',
            time: '1 year ago\n12/03/2025',
            check: 'Annual Checkup',
            buttons: 'View Report',
            colors: Color(0xff16964E),
            image: Image.asset('assets/images/cust.png'),
            color: Colors.white,
          ),
          SizedBox(height: 20),
          Customappointments(
            tags: 'Completed',
            first: 'Apolo Labs',
            second: 'Dr Anil Kumar',
            time: '1 year ago\n12/03/2025',
            check: 'Annual Checkup',
            buttons: 'View Report',
            colors: Color(0xff16964E),
            image: Image.asset('assets/images/cust.png'),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
