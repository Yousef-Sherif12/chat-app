import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBotonWidget extends StatelessWidget {
  CustomBotonWidget(
      {this.onTap,
      required this.botonText,
      required this.color,
      required this.radius});
  String? botonText;
  VoidCallback? onTap;
  Color color;
  BorderRadius radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(color: color, borderRadius: radius),
        child: Center(
          child: Text(
            botonText!,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
