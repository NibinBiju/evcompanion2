import 'package:flutter/material.dart';
import '../../utils/colorConstants.dart';

Widget customButton(String buttonText, onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          color: myappColor, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
