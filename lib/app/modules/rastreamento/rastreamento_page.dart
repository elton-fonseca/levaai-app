import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/tema/cores_const.dart';
import '../../core/view/conteudo_padrao.dart';
import '../../core/view/menu_lateral.dart';
import '../../core/view/navbar_padrao.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'rastreamento_controller.dart';

class RastreamentoPage extends StatefulWidget {
  final String title;
  const RastreamentoPage({Key key, this.title = "Rastreamento"})
      : super(key: key);

  @override
  _RastreamentoPageState createState() => _RastreamentoPageState();
}

class _RastreamentoPageState
    extends ModularState<RastreamentoPage, RastreamentoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF2E4983), Color(0xFF005BC3)])),
      child: Scaffold(
        appBar: NavbarPadrao().build(context),
        drawer: MenuLateral(),
        backgroundColor: Colors.transparent,
        body: ConteudoPadrao(
          textoCabecalho: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: displayWidth(context) * 0.22),
                child: Text(
                  'Meus Pedidos',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: displayWidth(context) * 0.06,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          conteudo: SizedBox(
            child: Column(
              children: <Widget>[
                SizedBox(height: displayHeight(context) * 0.05),
                Container(
                  width: displayWidth(context) * 0.90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(const Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                        color: CoresConst.azulPadrao.withOpacity(0.1),
                        spreadRadius: 10,
                        blurRadius: 15,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed('/rastreamento/detalhes');
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.03,
                                  left: displayWidth(context) * 0.05,
                                  right: displayWidth(context) * 0.1,
                                  bottom: displayHeight(context) * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "Pedido #23455",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          color: CoresConst.azulPadrao,
                                          fontSize:
                                              displayWidth(context) * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: displayHeight(context) * 0.02,
                                        child:
                                            Image.asset("assets/imagens/box-blue.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: displayWidth(context) * 0.05,
                                  right: displayWidth(context) * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Destino: ",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          "Avenida Paulista, 1234 ",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.grey[500],
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "São Paulo - SP | CEP: 12345-000",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.grey[500],
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ]),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: displayHeight(context) * 0.08,
                                        child:
                                            Image.asset("assets/imagens/pedido-ok.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: displayHeight(context) * 0.01,
                                      left: displayWidth(context) * 0.05,
                                      bottom: displayHeight(context) * 0.04),
                                  child: Text(
                                    "Elton Fonseca",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                      fontSize: displayWidth(context) * 0.04,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        height: 2,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed('/rastreamento/detalhes');
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.03,
                                  left: displayWidth(context) * 0.05,
                                  right: displayWidth(context) * 0.1,
                                  bottom: displayHeight(context) * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "Pedido #23455",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          color: CoresConst.azulPadrao,
                                          fontSize:
                                              displayWidth(context) * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: displayHeight(context) * 0.02,
                                        child:
                                            Image.asset("assets/imagens/box-blue.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: displayWidth(context) * 0.05,
                                  right: displayWidth(context) * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Destino: ",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          "Avenida Paulista, 1234 ",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.grey[500],
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "São Paulo - SP | CEP: 12345-000",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.grey[500],
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ]),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: displayHeight(context) * 0.08,
                                        child: Image.asset(
                                            "assets/imagens/pedido-aguardando.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: displayHeight(context) * 0.01,
                                      left: displayWidth(context) * 0.05,
                                      bottom: displayHeight(context) * 0.04),
                                  child: Text(
                                    "Elton Fonseca",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                      fontSize: displayWidth(context) * 0.04,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        height: 2,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed('/rastreamento/detalhes');
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.03,
                                  left: displayWidth(context) * 0.05,
                                  right: displayWidth(context) * 0.1,
                                  bottom: displayHeight(context) * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "Pedido #23455",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          color: CoresConst.azulPadrao,
                                          fontSize:
                                              displayWidth(context) * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: displayHeight(context) * 0.02,
                                        child:
                                            Image.asset("assets/box-blue.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: displayWidth(context) * 0.05,
                                  right: displayWidth(context) * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Destino: ",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          "Avenida Paulista, 1234 ",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.grey[500],
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "São Paulo - SP | CEP: 12345-000",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.grey[500],
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ]),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: displayHeight(context) * 0.08,
                                        child: Image.asset(
                                            "assets/imagens/pedido-atencao.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    left: displayWidth(context) * 0.05,
                                  ),
                                  child: Text(
                                    "Elton Fonseca",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                      fontSize: displayWidth(context) * 0.04,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  left: displayWidth(context) * 0.05,
                                  bottom: displayHeight(context) * 0.04),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    child: Icon(Icons.error_outline,
                                        size: displayWidth(context) * 0.06,
                                        color: Color(0xFFC13A1C)),
                                  ),
                                  Text(
                                    " Sua entrega precisa de atenção.",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFC13A1C),
                                      fontSize: displayWidth(context) * 0.04,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.08),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: displayWidth(context) * 0.7,
                          height: displayHeight(context) * 0.07,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            border: Border.all(
                              width: 3,
                              color: CoresConst.azulPadrao,
                            ),
                          ),
                          child: SizedBox.expand(
                            child: FlatButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Adicionar novo pedido",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: CoresConst.azulPadrao,
                                      fontSize: displayWidth(context) * 0.04,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Modular.to.pushNamed('/pedido/form');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: displayHeight(context) * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
