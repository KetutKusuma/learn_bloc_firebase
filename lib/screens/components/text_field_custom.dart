import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? isObsecure;
  final TextInputType? keyBoardType;
  final Widget? suffixIcon, prefixIcon;
  final VoidCallback? ontap;
  final String? Function(String?)? validator, onChanged;
  final String? errMsg;
  final FocusNode? focusNode;

  const TextFieldCustom({
    required this.controller,
    required this.hintText,
    this.errMsg,
    this.isObsecure = false,
    this.keyBoardType = TextInputType.text,
    this.onChanged,
    this.ontap,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObsecure!,
      focusNode: focusNode,
      keyboardType: keyBoardType,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        errorText: errMsg,
        hintStyle: TextStyle(
          color: Colors.grey[500],
        ),
      ),
    );
  }
}
