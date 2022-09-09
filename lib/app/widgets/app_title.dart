import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final EdgeInsets edgeInsets;

  const AppTitle({
    Key? key,
    required this.edgeInsets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edgeInsets,
      child: RichText(
        text: TextSpan(
          text: "Heroi da ",
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "Vez!",
              style: TextStyle(
                color: Colors.red[400],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
