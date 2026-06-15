import 'package:flutter/material.dart';

class Customsecondprofile extends StatelessWidget {
  const Customsecondprofile({
    super.key,
    required this.image,
    required this.first,
    required this.second,
  });
  final Image image;
  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),

        width: 372,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xff05818e),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: image,
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      first,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      second,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.download, color: Colors.white),
                ),
                Text(
                  'Download',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
