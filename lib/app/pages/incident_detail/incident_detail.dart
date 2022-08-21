import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IncidentDetailPage extends StatelessWidget {
  final int incidentId;

  const IncidentDetailPage({Key? key, required this.incidentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Detalhe da Pagina de incidente"),
    );
  }
}
