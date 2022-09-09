import 'package:flutter/material.dart';

import '../../../widgets/app_title.dart';

class IncidentHeader extends StatelessWidget {
  final int incidentsNumber;

  const IncidentHeader({
    Key? key,
    required this.incidentsNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 10,
        right: 10,
      ),
      child: Row(
        children: <Widget>[
          const AppTitle(
            edgeInsets: EdgeInsets.only(
              bottom: 20,
              top: 10,
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
