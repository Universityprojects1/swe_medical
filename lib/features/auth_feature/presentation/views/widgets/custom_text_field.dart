import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';

import '../../../../../core/utils/app_style.dart';

class CustomTextField extends StatefulWidget {
  final String text;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String title;

  const CustomTextField({
    super.key,
    required this.text,
    this.isPassword = false,
    this.validator,
     this.controller,
    required this.title,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style:  TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: AppStyle.responsiveFont(fontSize:20, context: context),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: _obscureText && widget.isPassword,
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffE9F6FE),
            hintText: widget.text,
            hintStyle:   TextStyle(
              color: AppColor.primaryColor,
              fontSize: AppStyle.responsiveFont(fontSize: 18, context: context),
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color:  Colors.white)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.red)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.white)),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      _obscureText = !_obscureText;
                      setState(() {});
                    },
                    icon: Icon(_obscureText
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
