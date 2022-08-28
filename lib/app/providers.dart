import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/pages/login/login_view_model.dart';
import 'package:provider/provider.dart';

class MultiProviderContext extends StatelessWidget {
  final Widget widget;

  const MultiProviderContext({Key? key, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        )
      ],
      child: widget,
    );
  }
}
