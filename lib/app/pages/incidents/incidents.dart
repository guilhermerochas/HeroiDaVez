import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/data/models/incident_case.dart';
import 'package:heroi_da_vez/app/pages/incidents/incidents_view_model.dart';
import 'package:heroi_da_vez/app/components/incident_card_item_detailed.dart';
import 'package:provider/provider.dart';

import '../../app_router.dart';
import '../../routes.dart';
import 'widgets/incident_header.dart';

class IncidentsPage extends StatelessWidget {
  late AppRouter _appRouter;

  IncidentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<IncidentsPageViewModel>();

    var incidentCases = viewModel.loadIncidents();
    _appRouter = context.read<AppRouter>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IncidentHeader(
                incidentsNumber: incidentCases.length,
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(end: 60, start: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Bem-vindo!",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "Escolha um dos casos abaixo e seja um Heroi.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  key: key,
                  itemBuilder: (context, index) {
                    IncidentCase incidentCase = incidentCases[index];
                    return IncidentCardItemDetailed(
                      incidentCase: incidentCase,
                      handleOnMoreDetailsButton: () => _handleIncidentSelected(
                        incidentCase.id,
                      ),
                    );
                  },
                  itemCount: incidentCases.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleIncidentSelected(int incidentId) {
    _appRouter.router.push(
      "${Routes.incidentDetail.defaultRouteName}$incidentId",
    );
  }
}
