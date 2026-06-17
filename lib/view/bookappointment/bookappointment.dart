import 'package:flutter/material.dart';
import 'package:medi_go/view/bookappointment/appointconfirm.dart';

class BookAppointmentscreen extends StatefulWidget {
  const BookAppointmentscreen({super.key});

  @override
  State<BookAppointmentscreen> createState() => _BookAppointmentscreenState();
}

class _BookAppointmentscreenState extends State<BookAppointmentscreen> {
  String selectedDoctor = "Dr. Anil Kumar";
  String selectedSlot = "10:15 AM";
  String? selectedSpeciality;
  DateTime selectedDate = DateTime(2026, 6, 23);

  late final TextEditingController _dateController;
  final TextEditingController _reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: _formatDate(selectedDate));
  }

  @override
  void dispose() {
    _dateController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    const weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return "${weekdays[date.weekday - 1]}, ${date.day} ${months[date.month - 1]} ${date.year}";
  }

  String _getWeekdayAbbr(DateTime date) {
    const abbr = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return abbr[date.weekday - 1];
  }

  List<DateTime> _getCarouselDates() {
    // Generate 7 days centered around selectedDate's week (Monday of that week)
    DateTime monday = selectedDate.subtract(
      Duration(days: selectedDate.weekday - 1),
    );
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF0F8894),
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = _formatDate(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final carouselDates = _getCarouselDates();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Header Stack with Overlapping Card
            SizedBox(
              height: 250,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Teal Header Container
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0F8894),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 22,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Book Appointment",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Overlapping Hospital Card
                  Positioned(
                    top: 110,
                    left: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.grey.shade100,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Hospital Logo (Apollo Hospitals stylized custom logo)
                          Container(
                            width: 66,
                            height: 66,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Custom medical symbol representing Apollo
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF0F4C5C),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 8,
                                        ),
                                      ),
                                      const SizedBox(width: 3),
                                      const Text(
                                        "Apolo",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF0F4C5C),
                                          letterSpacing: -0.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "HOSPITALS",
                                    style: TextStyle(
                                      fontSize: 6,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0F4C5C),
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Hospital Name
                          const Text(
                            "Apolo Hospital",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),

                          // Distance + Status Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                "2.5 km",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Text(
                                "Open 24×7",
                                style: TextStyle(
                                  color: Color(0xFF2E7D32),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
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

            const SizedBox(height: 46),

            // 2. Form Content Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Search field
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search by Name or Speciality",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFEEEEEE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Speciality Dropdown
                  const Text(
                    "Speciality",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    initialValue: selectedSpeciality,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFEEEEEE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    hint: Text(
                      "Select Speciality",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: "General",
                        child: Text("General"),
                      ),
                      DropdownMenuItem(
                        value: "Cardiology",
                        child: Text("Cardiology"),
                      ),
                      DropdownMenuItem(
                        value: "Pediatrics",
                        child: Text("Pediatrics"),
                      ),
                      DropdownMenuItem(
                        value: "Dermatology",
                        child: Text("Dermatology"),
                      ),
                      DropdownMenuItem(
                        value: "Orthopedics",
                        child: Text("Orthopedics"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedSpeciality = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Reason Field
                  const Text(
                    "Reason",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _reasonController,
                    decoration: InputDecoration(
                      hintText: "Explain Reason",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFEEEEEE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Date Selection
                  const Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          hintText: "Select from Calender",
                          hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                          suffixIcon: const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.black87,
                            size: 20,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFEEEEEE),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Dates Carousel row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          carouselDates.map((date) {
                            bool isSelected = DateUtils.isSameDay(
                              selectedDate,
                              date,
                            );
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDate = date;
                                  _dateController.text = _formatDate(date);
                                });
                              },
                              child: dateBox(
                                _getWeekdayAbbr(date),
                                date.day.toString(),
                                isSelected,
                              ),
                            );
                          }).toList(),
                    ),
                  ),

                  // Horizontal Divider Line
                  const Divider(
                    color: Colors.black12,
                    thickness: 1,
                    height: 40,
                  ),

                  // Doctor Selection
                  const Text(
                    "Doctor",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      doctorChip("Dr. Anil Kumar"),
                      doctorChip("Dr. Astha Singh"),
                      doctorChip("Dr. Ankur"),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Available Slots Selection
                  const Text(
                    "Available Slots",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      slotChip("10:15 AM"),
                      slotChip("11:30 AM"),
                      slotChip("12:15 PM"),
                      slotChip("01:30 PM"),
                      slotChip("04:30 PM"),
                      slotChip("04:45 PM"),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Confirm Button
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => AppointConfirmScreen(
                                  hospitalName: "Apolo Hospital",
                                  doctorName: selectedDoctor,
                                  appointmentDate: _formatDate(selectedDate),
                                  appointmentSlot: selectedSlot,
                                  speciality: selectedSpeciality ?? "General",
                                  reason:
                                      _reasonController.text.isNotEmpty
                                          ? _reasonController.text
                                          : "Regular Checkup",
                                ),
                          ),
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
                        "Confirm Appointment",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32), // Bottom spacing
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dateBox(String day, String date, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 58,
      height: 72,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF0F8894) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border:
            selected
                ? null
                : Border.all(color: Colors.grey.shade300, width: 1.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              color: selected ? Colors.white : Colors.grey.shade500,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget doctorChip(String name) {
    bool selected = selectedDoctor == name;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDoctor = name;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF0F8894) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? const Color(0xFF0F8894) : Colors.grey.shade300,
            width: 1.2,
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget slotChip(String time) {
    bool selected = selectedSlot == time;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSlot = time;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF0F8894) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? const Color(0xFF0F8894) : Colors.grey.shade300,
            width: 1.2,
          ),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
