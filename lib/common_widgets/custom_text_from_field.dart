import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool? filled;
  final Color? filledColro;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  // final int? maxLines;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.filled,
    this.filledColro,
    this.onChanged,
    this.validator,
    this.readOnly = false,
    // this.maxLines,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      readOnly: widget.readOnly,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword ? _obscureText : false,
      onChanged: widget.onChanged,
      // maxLines: widget.maxLines,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                splashColor: Colors.transparent,
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : Padding(padding: EdgeInsets.all(10.r), child: widget.suffixIcon),
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        filled: true,
        fillColor: widget.filledColro ?? Colors.transparent,
        hintStyle: TextStyle(
          color: AppColor.c8896AC.withValues(alpha: 0.5),
          fontSize: 16.sp,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.c8896AC.withValues(alpha: 0.6),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.c8896AC.withValues(alpha: 0.6),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.c8896AC.withValues(alpha: 0.6),
          ),
        ),
      ),
      style: TextFontStyle.textStyle16cFFFFFFW600,
    );
  }
}
