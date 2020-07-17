import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/shared/layout/botao_azul.dart';
import 'package:levaai1/app/shared/layout/botao_verde.dart';
import 'package:levaai1/app/shared/layout/menu_lateral.dart';
import 'home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Color((0xFFFFFFFF)),
            ),
            onPressed: () {
              debugPrint(
                  'Tem que chamar o drawer, sei lá q q deu, depois que coloquei o navigator deu ruim');
            },
          ),
          title: const Text(
            "LevaAí",
          ),
          backgroundColor: Color(0xFF326699),
        ),
        body: Scaffold(
            backgroundColor: Color(0xFF326699),
            body: Container(
              padding: EdgeInsets.only(
                top: 0,
                left: 40,
                right: 40,
              ),
              color: Color(0xFF326699),
              child: Column(
                children: <Widget>[
                  Text(
                    '',
                    style: TextStyle(
                      color: Color(0xFF326699),
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Bem-Vindo(a) ao LevaAí',
                    style: TextStyle(
                      color: Color(0xFF98c11c),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Envie ou receba encomendas de maneira rápida e simples',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 400,
                    height: 240,
                    child: null,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF98c11c),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: BotaoVerde(
                        onClick: () {
                          debugPrint('botao verde');
                          Modular.to.pushNamed('/pedido/form');
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Color(0xFF326699),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        border: Border.all(
                          width: 3,
                          color: Color(0xFFFFFFFF),
                        )),
                    child: SizedBox.expand(
                      child: BotaoAzul(
                        onClick: () {
                          debugPrint('ver pedidos');
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Ajuda',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Quem somos?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Contato',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            drawer: MenuLateral()));
  }
}
