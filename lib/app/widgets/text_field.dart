// ignore_for_file: must_be_immutable

import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:flutter/material.dart';

enum TextFieldSize { small }

class AppTextField extends StatefulWidget {
  final String? hint;
  final String? errorText;
  final String? helperText;
  final TextEditingController controller;
  final bool isPassword;
  final Widget? suffix;
  final Function(String)? onChanged;
  bool isDisabled = false;
  AppTextField({
    required this.controller,
    this.hint,
    this.helperText,
    this.errorText,
    this.isPassword = false,
    this.isDisabled = false,
    this.suffix,
    this.onChanged,
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    bool checkIfPassword = widget.isPassword;
    return TextField(
      enabled: !widget.isDisabled,
      style: AppTextStyle.black14,
      obscureText: checkIfPassword ? isObscure : false,
      controller: widget.controller,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      decoration: InputDecoration(
          hintText: widget.hint,
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: AppColor.white,
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColor.primaryColor3, width: 1),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColor.primaryColor3, width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.primaryColor3,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          disabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColor.primaryColor3, width: 0.6),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(10)),
          errorText: widget.errorText,
          helperText: widget.helperText,
          errorStyle: AppTextStyle.black12Bold
              .copyWith(fontWeight: FontWeight.w400, color: Colors.red),
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: Icon(
                    isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColor.grey,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.suffix ??
                        Container(
                          width: 1,
                        ),
                  ],
                )),
    );
  }
}

String? validateEmailTextFields(String value) {
  if (RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{1,7}$')
      .hasMatch(value)) {
    return null;
  } else if (value == "") {
    return "Email Field must not be empty";
  } else {
    return "Email is Invalid";
  }
}

String? validatePasswordTextFields(String value) {
  if (value.isEmpty) return "Password must not be empty";
  if (value.length < 6) return "Password must be at least 6 characters long";
  return null;
}

String? validatePhoneNumberTextFields(String value) {
  if (value.isEmpty) return "Phone number must not be empty";
  if (value.length < 11 || value.length > 11) {
    return "Phone number must be 11 characters long";
  }
  return null;
}

String? validateNameTextFields(String value) {
  if (value.isEmpty) return "Name can't be empty";
  return null;
}
