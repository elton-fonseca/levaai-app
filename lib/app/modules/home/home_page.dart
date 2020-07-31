import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/tema/cores_const.dart';
import '../../core/tema/cores_const.dart';
import '../../core/view/botao_azul.dart';
import '../../core/view/botao_verde.dart';
import '../../core/view/menu_lateral.dart';
import '../../core/view/tamanhos_relativos.dart';
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
          padding: EdgeInsets.only(top: displayHeight(context)*0.2),
          height: double.maxFinite,
          color: CoresConst.azulPadrao,
          child: Stack(
            children: <Widget>[
              Column(
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
              SizedBox(height: displayHeight(context) * 0.17),
              SizedBox(
                width: 120,
                child: Text(
                  'CLIQUE AQUI PARA FAZER UM PEDIDO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                child: Icon(Icons.arrow_downward, color: Color((0xFFFFFFFF)),),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  color: Colors.white,
                  height: displayHeight(context) * 0.121,
                  ),
              ),
            ),
            Positioned(
              bottom: displayHeight(context) * 0.061,
              right: displayWidth(context) * 0.393,
              child: Align(
              child: Container(
                width: 80,
                height: 80,
                child: MaterialButton(
                  shape: CircleBorder(
                    side: BorderSide(
                      width: 8, color: Colors.white, style: BorderStyle.solid)),
                  child: Icon(Icons.add, size: 30),
                  color: CoresConst.azulPadrao,
                  onPressed: (){},
                ),
              ),
              )
              ),  
            ]
            ,)
            ]
          ,)
        ),
        drawer: MenuLateral(),
      ),
    );
  }
}
