import 'package:flutter/material.dart';

class Customaddresstextfield extends StatefulWidget {
  const Customaddresstextfield({
    super.key,

    this.text,
    required this.title,

    this.widget,
    this.isDropdown = false,
    this.items,
    this.value,
    this.onChanged,
  });
  final String? text;

  final String title;

  final Widget? widget;
  final bool isDropdown;
  final List<String>? items;
  final String? value;
  final ValueChanged<String?>? onChanged;

  @override
  State<Customaddresstextfield> createState() => _CustomaddresstextfieldState();
}

class _CustomaddresstextfieldState extends State<Customaddresstextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          widget.isDropdown == true
              ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(
                        255,
                        193,
                        180,
                        180,
                      ).withOpacity(0.08),
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(163, 163, 163, 1),
                  ),
                ),
                child: DropdownButtonFormField<String>(
                  value: widget.value,
                  decoration: InputDecoration(
                    hintText: widget.text,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                  ),
                  items:
                      widget.items!
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                  onChanged: widget.onChanged,
                ),
              )
              : Container(
                height: 47,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(
                        255,
                        193,
                        180,
                        180,
                      ).withOpacity(0.08),
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(163, 163, 163, 1),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: widget.text,
                    suffixIcon: widget.widget,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
