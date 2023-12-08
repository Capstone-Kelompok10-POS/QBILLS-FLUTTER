import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

enum ButtonType { outline, filled, withIcon, outlineWithIcon }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType buttonType;
  final IconData? iconData;
  final double elevation;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.iconData,
    this.elevation = 0,
    this.buttonType = ButtonType.outline,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return buttonType == ButtonType.outline
        ? _buildOutlineButton()
        : buttonType == ButtonType.withIcon
            ? _buildButtonWithIcon()
            : buttonType == ButtonType.outlineWithIcon
                ? _buildOutlineButtonWithIcon()
                : _buildFilledButton();
  }

  Widget _buildOutlineButton() {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  Widget _buildFilledButton() {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: elevation,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: ColorsCollection.PrimaryColor),
        onPressed: onPressed,
        child: Text(text, style: AppTextStyles.textStyleButton),
      ),
    );
  }

  Widget _buildButtonWithIcon() {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(iconData),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: ColorsCollection.PrimaryColor,
        ),
      ),
    );
  }

  Widget _buildOutlineButtonWithIcon() {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          size: 16,
          color: ColorsCollection.PrimaryColor,
        ),
        label: Text(
          text,
          style: AppTextStyles.textStyleButton01,
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          side: const BorderSide(color: ColorsCollection.PrimaryColor),
        ),
      ),
    );
  }
}
