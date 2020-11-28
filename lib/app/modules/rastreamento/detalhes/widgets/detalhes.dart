import 'package:flutter/material.dart';
import 'package:levaai1/app/core/view/helpers.dart';
import '../../../../core/tema/cores_const.dart';
import '../../../../core/view/tamanhos_relativos.dart';

class Detalhes extends StatelessWidget {
  Detalhes({this.pedido});

  final Map pedido;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.95,
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
          Column(
            children: <Widget>[
              SizedBox(height: displayHeight(context) * 0.05),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.07,
                      right: displayWidth(context) * 0.06,
                    ),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: displayHeight(context) * 0.12,
                        child: Image(
                            image: AssetImage(
                                'assets/imagens/origem-destino-verde.png')),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: displayWidth(context) * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Origem:',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.grey[500],
                                fontSize: displayWidth(context) * 0.035,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            pedido['logradouro_origem'],
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey[500],
                              fontSize: displayWidth(context) * 0.035,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: displayHeight(context) * 0.03),
                          Text(
                            'Destino:',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.grey[500],
                                fontSize: displayWidth(context) * 0.035,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            pedido['logradouro_destino'],
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey[500],
                              fontSize: displayWidth(context) * 0.035,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: displayWidth(context) * 0.8,
            child: Divider(
              color: Colors.grey[300],
              height: displayHeight(context) * 0.05,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ),
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.05,
                      right: displayWidth(context) * 0.05,
                    ),
                    child: SizedBox(
                      height: displayHeight(context) * 0.04,
                      child: Image.asset("assets/imagens/box-fechada.png"),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Responsável pela coleta:',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        pedido['responsavel_coleta'],
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.035,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: displayHeight(context) * 0.025,
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.05,
                      right: displayWidth(context) * 0.05,
                    ),
                    child: SizedBox(
                      height: displayHeight(context) * 0.04,
                      child: Image.asset("assets/imagens/box-aberta.png"),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Responsável pela entrega:',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        pedido['responsavel_entrega'],
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.035,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: displayWidth(context) * 0.8,
            child: Divider(
              color: Colors.grey[300],
              height: displayHeight(context) * 0.05,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ),
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.05,
                      right: displayWidth(context) * 0.05,
                    ),
                    child: SizedBox(
                      height: displayHeight(context) * 0.04,
                      child: Image.asset("assets/imagens/box-fechada.png"),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Prazo de coleta:',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        Helpers.prazoDescricao(
                          pedido['cotacao']['prazo_coleta'].toString(),
                          'COLETA',
                        ),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.035,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: displayHeight(context) * 0.025,
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.05,
                      right: displayWidth(context) * 0.05,
                    ),
                    child: SizedBox(
                      height: displayHeight(context) * 0.04,
                      child: Image.asset("assets/imagens/box-aberta.png"),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Prazo de entrega:',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        Helpers.prazoDescricao(
                          pedido['cotacao']['prazo_entrega'].toString(),
                          'ENTREGA',
                        ),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.035,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: displayHeight(context) * 0.05)
        ],
      ),
    );
  }
}
