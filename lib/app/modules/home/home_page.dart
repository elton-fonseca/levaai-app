import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/tema/cores_const.dart';
import '../../core/view/menu_lateral.dart';
import '../../core/view/tamanhos_relativos.dart';
import '../pedido/pages/pedido_cotacao_page.dart';
import '../pedido/pages/pedido_form_page.dart';
import 'home_controller.dart';

//import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    PedidoFormPage(),
    PedidoCotacaoPage(),
  ];
  //use 'controller' variable to access controller
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Color(0xFF3a519e),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF344882), Color(0xFF355bbe)])),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: displayHeight(context) * 0.3),
                child: Center(
                  child: SizedBox(
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
              ),
              Text(
                'LEVAAI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'DAQUI PRA LÁ RAPIDINHO',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: displayHeight(context) * 0.18,
              ),
              SizedBox(
                width: 130,
                child: Text(
                  'CLIQUE AQUI PARA FAZER UM PEDIDO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.067,
                child:
                    Icon(Icons.arrow_downward, size: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 80.0,
          width: 80.0,
          child: FittedBox(
            child: FloatingActionButton(
              shape: CircleBorder(
                  side: BorderSide(
                      width: 4, color: Colors.white, style: BorderStyle.solid)),
              backgroundColor: Color(0xFF3a519e),
              child: Icon(Icons.add),
              onPressed: () {
                Modular.to.pushNamed('/pedido/form');
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
                      currentScreen =
                          PedidoCotacaoPage(); // setar pagina a ser ativa pelo buttom/icon
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
                          Modular.to.pushNamed('/login/formulario');
                        },
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = PedidoCotacaoPage();
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
                          onPressed: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: MenuLateral(),
      ),
    );
  }
}
