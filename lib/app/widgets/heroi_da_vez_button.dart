import 'package:flutter/material.dart';

class HeroiDaVezButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;

  const HeroiDaVezButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
