import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/Core/utils/assets_manager.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isObscured;
  final String? Function(String?)? validation;
  final TextEditingController controller;
  final Widget? suffixIcon;
  CustomTextFormField({
    required this.label,
    required this.hintText,
    required this.controller,
    this.validation,
    this.isObscured = false,
    this.suffixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool hidden = widget.isObscured;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 22.h),
      child: TextFormField(
        validator: widget.validation,
        obscureText: hidden,
        controller: widget.controller,
        style: TextStyle(color: Colors.grey,fontSize: 18),
        decoration: InputDecoration(

            label: Text(widget.label),
            labelStyle: TextStyle(color: Colors.grey),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: widget.isObscured
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        hidden = !hidden;
                      });
                    },
                    isSelected: !hidden,
                    selectedIcon: const Icon(Icons.remove_red_eye_rounded,size: 28,color: Colors.grey,),
                    icon: SvgPicture.asset(SvgManager.eyeClosedSvg))
                : widget.suffixIcon,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
