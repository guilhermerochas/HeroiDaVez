import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/widgets/app_title.dart';

class IncidentDetailPageHeader extends StatelessWidget {
  const IncidentDetailPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            bottom: 20,
            left: 10,
            right: 10,
          ),
          child: const AppTitle(
            edgeInsets: EdgeInsets.only(
              top: 20,
            ),
          ),
        ),
      ],
    );
  }
}
