import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/colors.dart';
import '../../common/sizes.dart';

class CustomElevatedButton extends StatelessWidget {
  final buttonText;
  final void Function()? onPressed;

  const CustomElevatedButton({
    super.key,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: tButtonHeigh,
        child: TextButton(
            style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: tButtonFontSize),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: tPrimaryColor,
                foregroundColor: tWhite),
            onPressed: onPressed,
            child: Text(buttonText.toUpperCase())),
      ),
    );
  }
}

class CustomDialogButton extends StatelessWidget {
  final buttonText;
  final Color textColor;
  final void Function()? onPressed;

  const CustomDialogButton({
    super.key,
    this.buttonText,
    this.onPressed,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: tButtonHeigh,
        child: TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: tButtonFontSize),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              //backgroundColor: tSecondaryColor,
              foregroundColor: textColor,
            ),
            onPressed: onPressed,
            child: Text(buttonText.toUpperCase())),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final void Function()? onPressed;

  const CustomBackButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
      //color: Colors.black,
    );
  }
}

class AppBarButton extends StatelessWidget {
  final String text;
  final double size;
  final void Function()? onPressed;

  const AppBarButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.transparent),
              foregroundColor: tPrimaryColor,
              backgroundColor: tBackgroundButtonColor,
              minimumSize: Size.fromHeight(10),
              fixedSize: const Size(0, 30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: tWhite,
            ),
          )),
    );
  }
}
