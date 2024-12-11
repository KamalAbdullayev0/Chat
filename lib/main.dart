import 'package:chat/src/config/router/router.dart';
import 'package:flutter/material.dart';
import 'package:supertokens_flutter/supertokens.dart';

void main() {
  SuperTokens.init(apiDomain: "http://40.81.146.73:8000");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = AppRouter();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
    );
  }
}
