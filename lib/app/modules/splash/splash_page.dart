import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  int currentTab = 0; // to keep track of active tab index

  //use 'controller' variable to access controller
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = SplashPage();

  @override
  void initState() {
    controller.boot();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Color(0xFF1d509a),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFF2E4983), Color(0xFF005BC3)],
          )),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: displayHeight(context) * 0.3),
                child: Center(
                  child: SizedBox(
                    height: displayHeight(context) * 0.1,
                    child: Image.asset("assets/imagens/logo.png"),
                  ),
                ),
              ),
              Text(
                'LEVAAI',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: displayHeight(context) * 0.065,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
