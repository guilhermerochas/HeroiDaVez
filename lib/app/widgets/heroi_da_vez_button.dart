import 'package:flutter/material.dart';

class HeroiDaVezButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final bool swapColors;
  final bool disabled;

  const HeroiDaVezButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
    this.swapColors = false,
    this.disabled = false,
  }) : super(key: key);

  void handleButtonOnPress() {
    if (onPressed == null) {
      return;
    }
    onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : handleButtonOnPress,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(disabled ? 0.5 : 2),
        backgroundColor: MaterialStateProperty.all(
          swapColors
              ? Colors.white70.withOpacity(disabled ? 0.2 : 1)
              : Colors.red[400]?.withOpacity(disabled ? 0.2 : 1),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: swapColors ? Colors.red[400] : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
