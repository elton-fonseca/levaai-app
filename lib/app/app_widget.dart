import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/tema/tema_levaai.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'LevaAi',
      theme: TemaLevaAi().obter(),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
