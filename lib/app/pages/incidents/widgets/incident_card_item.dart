import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/data/models/incident_case.dart';

class IncidentCardItem extends StatelessWidget {
  final IncidentCase incidentCase;
  final Function() handleOnMoreDetailsButton;

  const IncidentCardItem({
    Key? key,
    required this.incidentCase,
    required this.handleOnMoreDetailsButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      color: Colors.white,
      elevation: 0,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 15,
              left: 30,
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "CASO: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          incidentCase.caseName,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "ONG: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          incidentCase.organization.target!.name,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Valor: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "R\$ ${incidentCase.valueCost} reais",
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: Colors.grey[400],
          ),
          InkWell(
            onTap: handleOnMoreDetailsButton,
            child: Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              width: double.infinity,
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Text(
                    "Ver mais detalhes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red[400],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.red[400],
                    size: 20,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
