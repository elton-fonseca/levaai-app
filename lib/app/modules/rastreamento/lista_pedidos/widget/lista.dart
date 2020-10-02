import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/tema/cores_const.dart';
import '../../../../core/view/tamanhos_relativos.dart';

class Lista extends StatelessWidget {
  Lista({this.pedidos});

  final List pedidos;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.6,
      child: ListView.builder(
          itemCount: pedidos.length,
          itemBuilder: (context, index) {
            var pedido = pedidos[index];
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed(
                            '/rastreamento/detalhes/${pedido["id"].toString()}');
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
                                      "Pedido ${pedido["id"]}",
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
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    width: displayWidth(context) * 0.68,
                                    child: Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Destino: ",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Colors.grey[500],
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.035,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              pedido["logradouro_destino"],
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Colors.grey[500],
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.035,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ]),
                                    ),
                                  ),
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: displayHeight(context) * 0.01,
                                        left: displayWidth(context) * 0.03,
                                        bottom: displayHeight(context) * 0.03),
                                    child: Text(
                                      pedido["responsavel_entrega"],
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[500],
                                        fontSize: displayWidth(context) * 0.035,
                                      ),
                                    ),
                                  ),
                                ],
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
