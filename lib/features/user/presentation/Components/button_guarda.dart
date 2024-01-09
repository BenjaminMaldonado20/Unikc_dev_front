import 'package:flutter/material.dart';

class MyButtonH extends StatelessWidget {
  final Function()? onTap;

  const MyButtonH({Key? key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(81, 78, 235, 55),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "Guardia",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),

    );
  }
}