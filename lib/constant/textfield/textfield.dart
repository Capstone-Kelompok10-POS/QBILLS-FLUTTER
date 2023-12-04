import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

enum CustomTextFieldType {
  outlined,
  filled,
  withIcon,
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final CustomTextFieldType fieldType;
  final bool isPassword;
  final FormFieldSetter<String>? onSaved;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.onSubmitted,
      this.validator,
      this.fieldType = CustomTextFieldType.outlined,
      this.isPassword = false,
      this.onSaved})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    switch (widget.fieldType) {
      case CustomTextFieldType.outlined:
        return TextFormField(
          onSaved: widget.onSaved,
          controller: widget.controller,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          decoration: InputDecoration(
            hintStyle: AppTextStyles.hintstyletext,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1, color: ColorsCollection.GreyNeutral),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1, color: ColorsCollection.GreyNeutral),
            ),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: ColorsCollection.GreyNeutral,
                  )
                : null,
            suffixIcon: widget.suffixIcon != null
                ? Icon(
                    widget.suffixIcon,
                    color: ColorsCollection.GreyNeutral,
                  )
                : null,
            border: const OutlineInputBorder(),
          ),
        );
      case CustomTextFieldType.filled:
        return TextFormField(
          onSaved: widget.onSaved,
          controller: widget.controller,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          decoration: InputDecoration(
            hintStyle: AppTextStyles.hintstyletext,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1, color: ColorsCollection.GreyNeutral),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1, color: ColorsCollection.GreyNeutral),
            ),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: ColorsCollection.GreyNeutral,
                  )
                : null,
            suffixIcon: widget.suffixIcon != null
                ? Icon(
                    widget.suffixIcon,
                    color: ColorsCollection.GreyNeutral,
                  )
                : null,
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        );
      case CustomTextFieldType.withIcon:
        return TextFormField(
          onSaved: widget.onSaved,
          controller: widget.controller,
          obscureText: widget.isPassword ? !isHidden : widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          decoration: InputDecoration(
            hintStyle: AppTextStyles.hintstyletext,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1, color: ColorsCollection.GreyNeutral),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1, color: ColorsCollection.GreyNeutral),
            ),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: ColorsCollection.GreyNeutral,
                  )
                : null,
            suffixIcon: widget.suffixIcon != null
                ? widget.isPassword == true
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        child: Icon(
                            color: ColorsCollection.GreyNeutral,
                            isHidden ? Icons.visibility_off : Icons.visibility),
                      )
                    : null
                : null,
            border: const OutlineInputBorder(),
          ),
        );
      default:
        return Container();
    }
  }
}
