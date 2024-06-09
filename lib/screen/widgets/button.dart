import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.function,
    required this.text,
    this.width = double.infinity,
    this.height = 50,
    this.radius = 10,
    this.gradient = true,
    this.color = const Color(0xFFCBCFDC),
  });

  final void Function() function;
  final String text;
  final double width;
  final double height;
  final double radius;
  final bool gradient;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient
            ? const LinearGradient(
                colors: [Color(0xFF3B59BA), Color(0xFF354A98)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
        color: gradient ? null : color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: gradient ? Colors.white : const Color(0xFF354A98),
            fontSize: height * 0.4,
          ),
        ),
      ),
    );
  }
}
