import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/tema/cores_const.dart';
import '../../core/tema/cores_const.dart';
import '../../core/view/botao_azul.dart';
import '../../core/view/botao_verde.dart';
import '../../core/view/menu_lateral.dart';
import 'home_controller.dart';
//import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: CoresConst.azulPadrao,
        body: Container(
          padding: EdgeInsets.only(top: 180),
          color: CoresConst.azulPadrao,
          child: Column(
            children: <Widget>[
              Center(
                child: SizedBox(
                    child: Image.asset("assets/logo.png"),
                  ),
              ),
              Text(
                  'LEVAAI',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),  
              Text(
                  'DAQUI PRA LÁ RAPIDINHO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                // este sized box é só pra termos uma noção visual, ainda não
                // consegui entender como fazer a diferenção junto ao botão
                // com espaço relativo
              SizedBox(height: 200),
              Container(
                width: 80,
                height: 80,
                child: MaterialButton(
                  shape: CircleBorder(
                    side: BorderSide(
                      width: 5, color: Colors.white, style: BorderStyle.solid)),
                  child: Icon(Icons.add, size: 30),
                  color: CoresConst.azulPadrao,
                  onPressed: (){},
                ),
              ),
            ],
          ),
        ),
        drawer: MenuLateral(),
      ),
    );
  }
}
