import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:flutter/material.dart';

enum ButtonLength { short, long }

enum ButtonType { filled, outlined, normal }

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final Color? buttonColor;
  final bool hasIcon;
  final IconData? icon;
  final bool isDisabled;
  final double? width;
  final ButtonLength? buttonLength;
  final ButtonType? buttonType;
  final bool isLoading;
  const AppButton({
    Key? key,
    required this.buttonText,
    this.onPressed,
    this.buttonColor,
    this.hasIcon = false,
    this.icon,
    this.isDisabled = false,
    this.width,
    this.buttonType = ButtonType.filled,
    this.buttonLength = ButtonLength.long,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: isDisabled
            ? null
            : isLoading
                ? null
                : onPressed ?? () {},
        height: 48,
        elevation: 0,
        disabledColor: buttonColor?.withOpacity(0.3) ?? AppColor.grey,
        minWidth: width ?? (buttonLength == ButtonLength.long ? 335 : 220),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: buttonType == ButtonType.outlined
                ? BorderSide(color: buttonColor ?? AppColor.grey)
                : BorderSide.none),
        color: buttonType == ButtonType.filled
            ? buttonColor ?? AppColor.black
            : AppColor.white,
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 17,
                  height: 17,
                  child: CircularProgressIndicator(
                    color: buttonColor ?? AppColor.white,
                    strokeWidth: 2.5,
                  ),
                ),
              )
            : hasIcon
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonText,
                        style: AppTextStyle.black14Thick.copyWith(
                            color: buttonType == ButtonType.filled
                                ? AppColor.white
                                : buttonColor ?? AppColor.black),
                      ),
                      Icon(
                        icon,
                        color: buttonType == ButtonType.filled
                            ? AppColor.white
                            : buttonColor ?? AppColor.black,
                        size: 15,
                      )
                    ],
                  )
                : Text(
                    buttonText,
                    style: AppTextStyle.black14Thick.copyWith(
                        color: buttonType == ButtonType.filled
                            ? AppColor.white
                            : buttonColor ?? AppColor.black),
                  ));
  }
}
