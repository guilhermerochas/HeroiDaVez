import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroi_da_vez/app/constants/assets.dart';
import 'package:heroi_da_vez/app/pages/login/login_view_model.dart';
import 'package:heroi_da_vez/app/widgets/heroi_da_vez_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final double logoHeightAndWidth = 200;

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            child: Consumer<LoginViewModel>(
              builder: (context, value, _) {
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
                      focusNode: value.focusNode,
                      keyboardType: TextInputType.number,
                      onChanged: (inputValue) => value.setHeroId(inputValue),
                      decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: const OutlineInputBorder(),
                        errorText: value.heroId.isValid()
                            ? null
                            : value.heroId.errorMessage,
                        labelText: 'Seu ID',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HeroiDaVezButton(
                      buttonText: "Login",
                      onPressed: () => value.handleOnLogin(),
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
                    const HeroiDaVezButton(
                      buttonText: "Entrar como Heroi",
                      swapColors: true,
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
}
