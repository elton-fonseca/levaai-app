import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/core/view/botao_azul.dart';

import '../../core/tema/cores_const.dart';
import '../../core/view/conteudo_padrao.dart';
import '../../core/view/menu_lateral.dart';
import '../../core/view/navbar_padrao.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'rastreamento_controller.dart';

class ListaPedidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.6,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed('/rastreamento/detalhes');
                      },
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: displayHeight(context) * 0.03,
                                left: displayWidth(context) * 0.03,
                                right: displayWidth(context) * 0.09,
                                bottom: displayHeight(context) * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "Pedido $index",
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        color: CoresConst.azulPadrao,
                                        fontSize: displayWidth(context) * 0.04,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: displayHeight(context) * 0.02,
                                      child: Image.asset(
                                          "assets/imagens/box-blue.png"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.03,
                                right: displayWidth(context) * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              displayWidth(context) * 0.03,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        "Avenida Paulista, 1234 ",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.grey[500],
                                          fontSize:
                                              displayWidth(context) * 0.03,
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
                                              displayWidth(context) * 0.03,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ]),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: displayHeight(context) * 0.07,
                                      child: Image.asset(
                                          "assets/imagens/pedido-ok.png"),
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
                                    left: displayWidth(context) * 0.03,
                                    bottom: displayHeight(context) * 0.03),
                                child: Text(
                                  "Elton Fonseca",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.03,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[300],
                            height: 2,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
