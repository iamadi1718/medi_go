import 'package:flutter/material.dart';
import 'package:medi_go/scan_qrscreen/qr_successfulscreen.dart';

class Scanscreen extends StatefulWidget {
  const Scanscreen({super.key});

  @override
  State<Scanscreen> createState() => _ScanscreenState();
}

class _ScanscreenState extends State<Scanscreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _zoomValue = 1.0;
  bool _isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.1, end: 0.9).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3E3E3), // Grey background matching mockup screenshot
      body: Column(
        children: [
          // 1. Teal Header
          Container(
            height: 110,
            decoration: const BoxDecoration(
              color: Color(0xFF0F8894),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 48.0), // Offsets back button to keep title centered
                      child: Text(
                        "Scan QR Code",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 60),
          
          // 2. Instruction Text
          const Text(
            "Align the QR code within the frame.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          const SizedBox(height: 40),
          
          // 3. Viewfinder Box
          Center(
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400, width: 1.5),
                gradient: RadialGradient(
                  colors: [
                    Colors.grey.shade700,
                    Colors.grey.shade900,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Animated White Scanner Line
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Positioned(
                        top: 220 * _animation.value,
                        left: 10,
                        right: 10,
                        child: Container(
                          height: 2.2,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.95),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withValues(alpha: 0.5),
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 50),
          
          // 4. Zoom Slider with - and +
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.remove, color: Colors.black87, size: 22),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color(0xFF0F8894),
                      inactiveTrackColor: Colors.black12,
                      thumbColor: const Color(0xFF0F8894),
                      overlayColor: const Color(0xFF0F8894).withValues(alpha: 0.15),
                      trackHeight: 2.0,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
                    ),
                    child: Slider(
                      value: _zoomValue,
                      min: 1.0,
                      max: 4.0,
                      onChanged: (value) {
                        setState(() {
                          _zoomValue = value;
                        });
                      },
                    ),
                  ),
                ),
                const Icon(Icons.add, color: Colors.black87, size: 22),
              ],
            ),
          ),
          
          const Spacer(),
          
          // 5. Bottom Action Buttons Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Gallery Button
                _circleIconButton(
                  icon: Icons.image_outlined,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Gallery import selected")),
                    );
                  },
                ),
                
                // Active Scan Button (Glowing)
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const QrSuccessfulscreen()),
                    );
                  },
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F8894),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F8894).withValues(alpha: 0.45),
                          blurRadius: 16,
                          spreadRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
                
                // Flash Toggle Button (Lightning Bolt)
                _circleIconButton(
                  icon: Icons.bolt,
                  iconColor: _isFlashOn ? const Color(0xFF0F8894) : Colors.black87,
                  onTap: () {
                    setState(() {
                      _isFlashOn = !_isFlashOn;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(_isFlashOn ? "Flashlight turned ON" : "Flashlight turned OFF")),
                    );
                  },
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _circleIconButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = Colors.black87,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.08), // Circular grey overlay
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 26,
        ),
      ),
    );
  }
}
