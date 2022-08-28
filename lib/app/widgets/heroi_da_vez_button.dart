import 'package:flutter/material.dart';

class HeroiDaVezButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final bool swapColors;

  const HeroiDaVezButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
    this.swapColors = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (onPressed == null) {
            return;
          }

          onPressed!();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            swapColors ? Colors.white70 : Colors.red[400],
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(color: swapColors ? Colors.red[400] : Colors.white),
        ),
      ),
    );
  }
}
