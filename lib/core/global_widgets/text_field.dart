import 'package:flutter/material.dart';
 
import '../style/global_textstyle.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscure;
  final bool? enabled; // Optional enabled parameter (nullable)
  final TextInputType keyboardType; // New optional parameter

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscure = false,
    this.enabled, // Optional parameter
    this.keyboardType = TextInputType.text, // Default to text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(64),
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: TextField(
          controller: controller,
          obscureText: isObscure,
          enabled: enabled ?? true, // Default to true if enabled is null
          keyboardType: keyboardType, // Set keyboard type
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
            hintText: hintText,
            hintStyle: globalTextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10),
                    child: suffixIcon,
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),
            border: InputBorder.none,
          ),
          style: globalTextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}