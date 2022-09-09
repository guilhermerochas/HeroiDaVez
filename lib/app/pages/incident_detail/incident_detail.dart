import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/pages/incident_detail/incident_detail_view_model.dart';
import 'package:heroi_da_vez/app/pages/incident_detail/widgets/incident_detail_card_item.dart';
import 'package:heroi_da_vez/app/pages/incident_detail/widgets/incident_detail_page_header.dart';
import 'package:provider/provider.dart';

class IncidentDetailPage extends StatelessWidget {
  final int incidentId;

  const IncidentDetailPage({
    Key? key,
    required this.incidentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contextProvider = context.read<IncidentDetailViewModel>();
    var incident = contextProvider.handleFindIncidentCase(incidentId);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const IncidentDetailPageHeader(),
              IncidentDetailCardItem(
                incidentCase: incident,
              )
            ],
          ),
        ),
      ),
    );
  }
}
