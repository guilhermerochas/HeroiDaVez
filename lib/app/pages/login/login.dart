import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroi_da_vez/app/app_router.dart';
import 'package:heroi_da_vez/app/constants/assets.dart';
import 'package:heroi_da_vez/app/pages/login/login_view_model.dart';
import 'package:heroi_da_vez/app/widgets/heroi_da_vez_button.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AppRouter appRouter = context.read<AppRouter>();
  final double logoHeightAndWidth = 200;
  final double circularBorderRadious = 15;
  final FocusNode _focusNode = FocusNode();

  void _handleOnLoginClick(LoginViewModel loginViewModel) {
    _focusNode.unfocus();
    var isValid = loginViewModel.handleIsLoginValid();

    if (isValid) {
      _handleNavigateToLogin();
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(circularBorderRadious),
            topRight: Radius.circular(circularBorderRadious),
          ),
        ),
        backgroundColor: Colors.red[300],
        content: Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            "ONG não encontrada com este Id!",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Consumer<LoginViewModel>(
              builder: (context, viewModel, _) {
                return Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage(
                        Assets.heroiDaVezLogo,
                      ),
                      height: logoHeightAndWidth,
                      width: logoHeightAndWidth,
                      fit: BoxFit.cover,
                    ),
                    TextField(
                      obscureText: false,
                      focusNode: _focusNode,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      onChanged: viewModel.setHeroId,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: const OutlineInputBorder(),
                        errorText: viewModel.heroId.isValid()
                            ? null
                            : viewModel.heroId.errorMessage,
                        labelText: 'Seu ID',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    HeroiDaVezButton(
                      buttonText: "Login",
                      onPressed: () => _handleOnLoginClick(viewModel),
                      disabled: !viewModel.heroId.isValid(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "ou",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HeroiDaVezButton(
                      buttonText: "Entrar como Heroi",
                      swapColors: true,
                      onPressed: () {
                        _focusNode.unfocus();
                        _handleOnClickIncidentsButton();
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _handleNavigateToLogin() {
    appRouter.router.push(Routes.profilePage.toString());
  }

  void _handleOnClickIncidentsButton() {
    appRouter.router.push(Routes.incidentsPage.toString());
  }
}
