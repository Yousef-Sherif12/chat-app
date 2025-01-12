// ignore_for_file: must_be_immutable, duplicate_ignore

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFieldWithNext extends StatelessWidget {
  CustomTextFormFieldWithNext(
      {super.key,
      this.onChange,
      this.hintText,
      this.obscuretext = false,
      required this.icon});
  String? hintText;
  Function(String)? onChange;
  Icon icon;
  bool obscuretext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      style: const TextStyle(color: Colors.black),
      onChanged: onChange,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 15, color: Colors.black),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormFieldWithDone extends StatelessWidget {
  CustomTextFormFieldWithDone(
      {super.key,
      this.onChange,
      this.hintText,
      this.obscuretext = false,
      this.suffixIcon,
      required this.icon});
  String? hintText;
  Function(String)? onChange;
  bool obscuretext;
  Icon icon;
  IconButton? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      style: const TextStyle(color: Colors.black),
      onChanged: onChange,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(fontSize: 15, color: Colors.grey[600]),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
