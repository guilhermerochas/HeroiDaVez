import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/app_router.dart';
import 'package:heroi_da_vez/app/widgets/app_title.dart';
import 'package:provider/provider.dart';

import '../../data/models/incident_case.dart';
import '../../data/models/non_governmental_organization.dart';
import '../incidents/widgets/incident_card_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var incidentCase = IncidentCase(
      caseName: 'Doação para animais',
      description: 'Nos ajude para uma doação de animais carentes',
      valueCost: 120,
      id: 0,
    );

    incidentCase.organization.target = NonGovernamentalOrganization(
      name: 'Ong do Bem',
      loginCode: '112233',
      email: 'ongdobem@gmail.com',
    );

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => _showLogoutAlert(context),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              children: <Widget>[
                const AppTitle(
                  edgeInsets: EdgeInsets.only(
                    bottom: 20,
                    top: 10,
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
                      return IncidentCardItem(
                        incidentCase: incidentCase,
                        handleOnMoreDetailsButton: () => null,
                      );
                    },
                    itemCount: 30,
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red[400],
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _showLogoutAlert(BuildContext context) {
    return AlertDialog(
      title: const Text('Deseja deslogar?'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Você deseja deslogar da aplicação?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Sim'),
          onPressed: () {
            context.read<AppRouter>().router.pop();
          },
        ),
      ],
    );
  }
}
