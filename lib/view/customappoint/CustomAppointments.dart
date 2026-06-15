import 'package:flutter/material.dart';

class Customappointments extends StatelessWidget {
  const Customappointments({
    super.key,
    required this.tags,
    required this.first,
    required this.second,
    required this.time,
    required this.check,
    required this.buttons,
    required this.colors,
    required this.image,
    required this.color,
  });
  final String tags;
  final String first;
  final String second;
  final String time;
  final String check;
  final String buttons;
  final Color colors;
  final Image image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: -20,

            child: Container(
              height: 20,
              width: 83,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colors,
              ),
              child: Center(child: Text(tags, style: TextStyle(color: color))),
            ),
          ),
          Container(
            width: 370,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 0.5, color: Colors.black),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          image,
                          Column(
                            children: [
                              Text(
                                first,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(second),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(check),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Icon(Icons.alarm),
                          SizedBox(width: 10),
                          Text(time),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 34,
                        width: 113,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color(0xff05818e),
                        ),
                        child: Center(
                          child: Text(
                            buttons,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
