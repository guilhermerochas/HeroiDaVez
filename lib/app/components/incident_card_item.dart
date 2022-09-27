import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/data/models/incident_case.dart';

class IncidentCardItem extends StatelessWidget {
  final IncidentCase incidentCase;

  const IncidentCardItem({
    Key? key,
    required this.incidentCase,
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
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "ONG: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            incidentCase.organization.target!.name,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Descrição: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  incidentCase.description,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
