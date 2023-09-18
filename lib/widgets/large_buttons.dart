import 'package:flutter/material.dart';
import 'package:payment_app/components/colors.dart';

class AppLargeButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final Function()? onTap;
  final bool? isBorder;

  const AppLargeButton({Key? key,
    this.backgroundColor = AppColor.mainColor,
    this.textColor,
    required this.text,
    this.onTap,
    this.isBorder = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 60, right: 60),
        height: 60,
        width: MediaQuery.of(context).size.width-120,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: AppColor.mainColor
          )
        ),
        child: Center(
          child: Text(text, style: TextStyle(fontSize: 28, color: textColor),
      ),
        ),
    ));
  }
}
