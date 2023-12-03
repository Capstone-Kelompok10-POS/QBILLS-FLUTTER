import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

enum ButtonType { outline, filled }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonType = ButtonType.outline,
  });

  @override
  Widget build(BuildContext context) {
    return buttonType == ButtonType.outline
        ? _buildOutlineButton()
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
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: ColorsCollection.PrimaryColor),
        onPressed: onPressed,
        child: Text(text, style: AppTextStyles.textStyleButton),
      ),
    );
  }
}
