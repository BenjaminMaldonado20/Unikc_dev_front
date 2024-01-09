import 'package:flutter/material.dart';

class MyButtonR extends StatelessWidget {
  final Function()? onTap;

  const MyButtonR({Key? key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: const Color.fromARGB(200, 0, 0, 0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "Residente",
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