import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/tema/cores_const.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  int currentTab = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

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
              Text(
                'DAQUI PRA LÁ RAPIDINHO',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: displayHeight(context) * 0.017,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: displayHeight(context) * 0.24,
              ),
              SizedBox(
                width: 130,
                child: Text(
                  'CLIQUE AQUI PARA FAZER UM PEDIDO',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: displayHeight(context) * 0.015,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.067,
                child: Icon(Icons.arrow_downward, size: displayWidth(context) * 0.08, color: Colors.white),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 80.0,
          width: 80.0,
          child: FittedBox(
            child: FloatingActionButton(
              shape: CircleBorder(side: BorderSide(width: 4, color: Colors.white, style: BorderStyle.solid)),
              backgroundColor: CoresConst.azulPadrao,
              child: Icon(Icons.add),
              onPressed: () {
                Modular.to.pushNamed('/pedido/formulario/0/criar');
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Container(
            height: displayHeight(context) * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      // setar pagina a ser ativa pelo buttom/icon
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.person,
                          color: CoresConst.azulPadrao,
                          size: 30,
                        ),
                        onPressed: () {
                          Modular.to.pushNamed('/login/formulario/lista-pedidos');
                        },
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.rotate(
                        angle: 270 * 3.14 / 180,
                        child: IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: CoresConst.azulPadrao,
                            size: 30,
                          ),
                          onPressed: () {
                            Modular.to.pushNamed('/usuario/cadastro');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
