import 'package:flutter/material.dart';

import 'widgets/incident_card_item.dart';
import 'widgets/incident_header.dart';

class IncidentsPage extends StatelessWidget {
  const IncidentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMarginSize = MediaQuery.of(context).size.height * 0.05;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: heightMarginSize,
            ),
            const IncidentHeader(),
            const Text(
              "Bem-vindo!",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            const Text(
              "Escolha um dos casos abaixo e seja um Heroi.",
              style: TextStyle(
                fontSize: 25,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                key: key,
                itemBuilder: (context, index) =>
                    Text("Hello World ${index + 1}"),
                itemCount: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
