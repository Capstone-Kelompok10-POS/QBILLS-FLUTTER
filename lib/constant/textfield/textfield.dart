import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

enum TextFieldType { outlined, filled }

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final TextFieldType textFieldType;
  final bool obscureText;
  final ValueChanged<bool>? onVisibilityToggle;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.textFieldType = TextFieldType.outlined,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onVisibilityToggle,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return widget.textFieldType == TextFieldType.outlined
        ? _buildOutlinedTextField()
        : _buildFilledTextField();
  }

  Widget _buildOutlinedTextField() {
    return TextField(
      cursorColor: ColorsCollection.BlackNeutral,
      controller: widget.controller,
      obscureText: _isHidden,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        prefixIconColor: ColorsCollection.GreyNeutral,
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isHidden = !_isHidden;
                  });
                },
                child: Icon(_isHidden == true
                    ? Icons.visibility
                    : Icons.visibility_off),
              )
            : null,
        suffixIconColor: ColorsCollection.GreyNeutral,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(width: 1, color: ColorsCollection.GreyNeutral),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(width: 1, color: ColorsCollection.GreyNeutral),
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyles.hintText,
      ),
    );
  }

  Widget _buildFilledTextField() {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorsCollection.GreyNeutral),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorsCollection.GreyNeutral),
        ),
        labelText: widget.hintText,
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
