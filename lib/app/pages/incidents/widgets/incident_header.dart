import 'package:flutter/material.dart';

class IncidentHeader extends StatelessWidget {
  final int incidentsNumber;

  const IncidentHeader({
    Key? key,
    required this.incidentsNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: "Heroi da ",
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
                fontSize: 25,
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
          const Spacer(),
          RichText(
            text: TextSpan(
              text: "Total de ",
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: "$incidentsNumber casos",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
