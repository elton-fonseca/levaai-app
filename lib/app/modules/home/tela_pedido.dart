/* import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/tema/cores_const.dart';
import '../pedido/pages/pedido_cotacao_page.dart';
import '../pedido/pages/pedido_form_page.dart';
import '../../core/view/menu_lateral.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'home_controller.dart';
import '../pedido/controllers/pedido_form_controller.dart';
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
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: displayWidth(context)*0.07),
            child: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white),
              onPressed: (){
                debugPrint('Voltar');
                },
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: displayWidth(context)*0.05),
              child: IconButton(icon: Icon(Icons.menu,), onPressed: (){
                debugPrint('Menu Lateral');
                },)
            ),
          ],
          backgroundColor: CoresConst.azulPadrao,
        ),
      backgroundColor: CoresConst.azulPadrao,
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: displayWidth(context)*0.09,
                  bottom: displayHeight(context)*0.04,
                  top: displayHeight(context)*0.01
                  ),
                child: Text(
                      'Configure o seu pedido',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
              ),
              Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                  )
                ),
                width: displayWidth(context)*1,
                height: displayHeight(context)*0.8,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: displayWidth(context)*0.07,
                        top: displayHeight(context)*0.02
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(
                                width: displayWidth(context)*0.07,
                                height: 65,
                                child: Image.asset("assets/item-request.png"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          SizedBox(width: 15,),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                width: displayWidth(context)*0.7,
                                height: displayHeight(context)*0.1,
                                child:  TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Origem',
                                    hintText:   'Avenida Paulsita, 234'
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: displayWidth(context)*0.7,
                                height: displayHeight(context)*0.1,
                                child:  TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Destino',
                                    hintText:   'Avenida Faria lima, 344'
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                  ]
                ),
                    ),
                  ]
                ),
              ),
            ),
            ] 
          ),
        ),
      ),
    );
  }
}
 */