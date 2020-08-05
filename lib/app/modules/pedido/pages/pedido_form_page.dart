import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../../../core/tema/cores_const.dart';
import '../../../core/view/botao_azul.dart';
import '../controllers/pedido_form_controller.dart';
import 'widgets/medida_relativa.dart';

class PedidoFormPage extends StatefulWidget {
  final String title;
  const PedidoFormPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoFormPageState createState() => _PedidoFormPageState();
}

class _PedidoFormPageState
    extends ModularState<PedidoFormPage, PedidoFormController> {
  //use 'controller' variable to access controller

  final _itens = List<String>.generate(10, (i) => "Item $i");

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
                Navigator.pop(context);
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
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: displayWidth(context)*0.07,
                          top: displayHeight(context)*0.02
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: displayWidth(context)*0.05),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: displayWidth(context)*0.78,
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
                                    width: displayWidth(context)*0.78,
                                    height: displayHeight(context)*0.1,
                                    child:  TextFormField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: 'Destino',
                                        hintText:   'Avenida Faria lima, 344'
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                        ),
                      ),
                      SizedBox(height: displayHeight(context)*0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: displayHeight(context)*0.2,
                            width: displayHeight(context)*0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(const Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            height: displayHeight(context)*0.2,
                            width: displayHeight(context)*0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(const Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: displayHeight(context)*0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              width: displayHeight(context)*0.185,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                   IconButton(
                                     icon: Icon(
                                       Icons.remove_circle,
                                       color: Colors.grey,
                                       size: 35,
                                       ),
                                       onPressed: (){
                                         Navigator.pop(context);
                                        },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:5.0),
                                      child: Text(
                                        '0',
                                        style: TextStyle(
                                            color: CoresConst.azulPadrao,
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                     icon: Icon(
                                       Icons.add_circle,
                                       color: Colors.grey,
                                       size: 35,
                                       ),
                                       onPressed: (){
                                         Navigator.pop(context);
                                        },
                                    ),
                                  ]
                                ),
                              ),
                            ),
                            SizedBox(
                            width: displayHeight(context)*0.185,
                             child: Container(
                                child: Row(
                                  children: <Widget>[
                                   IconButton(
                                     icon: Icon(
                                       Icons.remove_circle,
                                       color: Colors.grey,
                                       size: 35,
                                       ),
                                       onPressed: (){
                                         Navigator.pop(context);
                                        },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:5.0),
                                      child: Text(
                                        '0',
                                        style: TextStyle(
                                            color: CoresConst.azulPadrao,
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                     icon: Icon(
                                       Icons.add_circle,
                                       color: Colors.grey,
                                       size: 35,
                                       ),
                                       onPressed: (){
                                         Navigator.pop(context);
                                        },
                                    ),
                                  ]
                                ),
                              ),
                            ),
                          ]
                        ,),
                        SizedBox(height: displayHeight(context)*0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: displayHeight(context)*0.2,
                            width: displayHeight(context)*0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(const Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            height: displayHeight(context)*0.2,
                            width: displayHeight(context)*0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(const Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: displayHeight(context)*0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: displayHeight(context)*0.185,
                              child: Row(
                                children: <Widget>[
                                 IconButton(
                                   icon: Icon(
                                     Icons.remove_circle,
                                     color: Colors.grey,
                                     size: 35,
                                     ),
                                     onPressed: (){
                                       Navigator.pop(context);
                                      },
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left:5.0),
                                      child: Text(
                                        '0',
                                        style: TextStyle(
                                            color: CoresConst.azulPadrao,
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  IconButton(
                                   icon: Icon(
                                     Icons.add_circle,
                                     color: Colors.grey,
                                     size: 35,
                                     ),
                                     onPressed: (){
                                       Navigator.pop(context);
                                      },
                                  ),
                                ]
                              ),
                            ),
                            Container(
                              width: displayHeight(context)*0.185,
                              child: Row(
                                children: <Widget>[
                                 IconButton(
                                   icon: Icon(
                                     Icons.remove_circle,
                                     color: Colors.grey,
                                     size: 35,
                                     ),
                                     onPressed: (){
                                       Navigator.pop(context);
                                      },
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left:5.0),
                                      child: Text(
                                        '0',
                                        style: TextStyle(
                                            color: CoresConst.azulPadrao,
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  IconButton(
                                   icon: Icon(
                                     Icons.add_circle,
                                     color: Colors.grey,
                                     size: 35,
                                     ),
                                     onPressed: (){
                                       Navigator.pop(context);
                                      },
                                  ),
                                ]
                              ),
                            ),
                          ]
                        ,),
                        SizedBox(height: displayHeight(context)*0.04),
                        Container(
                            width: displayWidth(context)*0.78,
                            height: 45,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                border: Border.all(
                                  width: 3,
                                  color: CoresConst.azulPadrao,
                                )
                            ),
                            child: SizedBox.expand(
                              child: FlatButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Tenho medidas exatas",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: CoresConst.azulPadrao,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                },
                              ),
                            ),
                          ),
                        SizedBox(height: displayHeight(context)*0.04),
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
