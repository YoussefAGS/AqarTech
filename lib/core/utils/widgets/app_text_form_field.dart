import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/colors/colors.dart';
import '../../style/text_styles/text_styles.dart';

class AppTextFormField extends StatefulWidget {
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Color? borderColor;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChange;

  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  final TextInputAction? textActionInput;
  final bool? enable;

  final int? minLines;

  const AppTextFormField({
    super.key,
    this.minLines,

    this.maxLines,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.keyboardType,
    this.textActionInput,
    this.enable,
    this.borderColor,
    this.focusNode,
    this.onChange,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late FocusNode _focusNode;
  late Color _currentBorderColor;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _currentBorderColor = widget.borderColor ?? ColorsManager.gray;

    _focusNode.addListener(() {
      setState(() {
        _currentBorderColor = _focusNode.hasFocus
            ? ColorsManager.mainColor
            : widget.borderColor ?? ColorsManager.gray;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChange,
      focusNode: _focusNode,
      textInputAction: widget.textActionInput ?? TextInputAction.next,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: _currentBorderColor,
                width: 1.3.sp,
              ),
              borderRadius: BorderRadius.circular(10.0.sp),
            ),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: _currentBorderColor,
                width: 1.3.sp,
              ),
              borderRadius: BorderRadius.circular(10.0.sp),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3.sp,
          ),
          borderRadius: BorderRadius.circular(10.0.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3.sp,
          ),
          borderRadius: BorderRadius.circular(10.0.sp),
        ),
        hintStyle: widget.hintStyle ?? TextStyles.font15black500,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        fillColor: widget.backgroundColor ?? Colors.transparent,
        filled: true,

      ),
      maxLines: widget.maxLines ?? null,
      minLines: widget.minLines ?? null,
      enabled: widget.enable ?? true,
      obscureText: widget.isObscureText ?? false,
      style: TextStyles.font15black500,
      validator: (value) {
        return widget.validator(value);
      },
    );
  }
}
