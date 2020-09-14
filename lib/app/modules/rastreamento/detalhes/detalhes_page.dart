import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/tema/cores_const.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/menu_lateral.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import 'detalhes_controller.dart';

class DetalhesPage extends StatefulWidget {
  final String title;
  const DetalhesPage({Key key, this.title = "Detalhes"}) : super(key: key);

  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState
    extends ModularState<DetalhesPage, DetalhesController> {
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
            width: displayWidth(context) * 0.7,
            child: Column(
              children: <Widget>[
                SizedBox(height: displayHeight(context) * 0.05),
                Container(
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
                                  left: displayWidth(context) * 0.05,
                                  right: displayWidth(context) * 0.05,
                                ),
                                child: Column(children: <Widget>[
                                  SizedBox(
                                    height: displayHeight(context) * 0.09,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/origem-destino-verde.png')),
                                  ),
                                ]),
                              ),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Origem: ",
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
                                  SizedBox(
                                      height: displayHeight(context) * 0.03),
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
                                ],
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
                                  child: Image.asset("assets/box-fechada.png"),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Responsável pela coleta',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: displayWidth(context) * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Text(
                                'Elton Fonseca',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: displayWidth(context) * 0.04,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
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
                                  child: Image.asset("assets/box-aberta.png"),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Responsável pela coleta',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: displayWidth(context) * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Text(
                                'Elton Fonseca',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: displayWidth(context) * 0.04,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: displayHeight(context) * 0.05),
                    ],
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                Container(
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
                      Padding(
                        padding: EdgeInsets.only(
                          top: displayHeight(context) * 0.05,
                          left: displayWidth(context) * 0.05,
                          right: displayWidth(context) * 0.09,
                          bottom: displayHeight(context) * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Pedido #23455",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: CoresConst.azulPadrao,
                                fontSize: displayWidth(context) * 0.06,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: displayWidth(context) * 0.0),
                              child: SizedBox(
                                height: displayHeight(context) * 0.02,
                                child: Image.asset("assets/box-blue.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.039,
                                bottom: displayHeight(context) * 0.055),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  child: Icon(Icons.fiber_manual_record,
                                      size: displayWidth(context) * 0.08,
                                      color: Color(0xFF95c330)),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "Pagamento aprovado",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.005,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "20/10/2020",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.005,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "18:56h",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                        height: 20,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.039,
                                bottom: displayHeight(context) * 0.055),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  child: Icon(Icons.fiber_manual_record,
                                      size: displayWidth(context) * 0.08,
                                      color: Color(0xFF95c330)),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "Pedido Retirado",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.005,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "20/10/2020",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.005,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "18:56h",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                        height: 20,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.039,
                                bottom: displayHeight(context) * 0.055),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  child: Icon(Icons.fiber_manual_record,
                                      size: displayWidth(context) * 0.08,
                                      color: Color(0xFF95c330)),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "Pedido em trânsito",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.005,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "20/10/2020",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.005,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "18:56h",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                        height: 20,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.039,
                                bottom: displayHeight(context) * 0.055),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  child: Icon(Icons.fiber_manual_record,
                                      size: displayWidth(context) * 0.08,
                                      color: Color(0xFF95c330)),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "Pedido entregue",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.005,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "20/10/2020",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.005,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "18:56h",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.20),
                            child: Align(
                              alignment: Alignment.centerRight,
                                                          child: Column(
                                children: <Widget>[
                                  Image.asset("assets/pedido-ok.png", width: displayHeight(context)*0.08),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                        height: 20,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Container(
                        width: displayWidth(context) * 0.95,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
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
                            Padding(
                              padding: EdgeInsets.only(
                                top: displayHeight(context) * 0.03,
                                left: displayWidth(context) * 0.05,
                                right: displayWidth(context) * 0.05,
                                bottom: displayHeight(context) * 0.03,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Detalhes do pedido:',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: CoresConst.azulPadrao,
                                      fontSize: displayWidth(context) * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.05,
                                right: displayWidth(context) * 0.05,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Item 1',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    'Qtd.: 1',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.05,
                                right: displayWidth(context) * 0.05,
                                bottom: displayWidth(context) * 0.05,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '(90cm x 90cm x 90cm)',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: displayWidth(context) * 0.04,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: displayWidth(context) * 0.85,
                              child: Divider(
                                color: Colors.grey[300],
                                height: 2,
                                thickness: 2,
                                indent: 0,
                                endIndent: 0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.05,
                                right: displayWidth(context) * 0.05,
                                top: displayWidth(context) * 0.05,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Item 1',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    'Qtd.: 1',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.05,
                                right: displayWidth(context) * 0.05,
                                bottom: displayWidth(context) * 0.05,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '(90cm x 90cm x 90cm)',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: displayWidth(context) * 0.04,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: displayWidth(context) * 0.85,
                              child: Divider(
                                color: Colors.grey[300],
                                height: 2,
                                thickness: 2,
                                indent: 0,
                                endIndent: 0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.05,
                                right: displayWidth(context) * 0.05,
                                top: displayWidth(context) * 0.05,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Item 1',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    'Qtd.: 1',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.05,
                                right: displayWidth(context) * 0.05,
                                bottom: displayWidth(context) * 0.05,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '(90cm x 90cm x 90cm)',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: displayWidth(context) * 0.04,
                                      color: Colors.grey[500],
                                    ),
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
                                      fontFamily: 'Roboto',
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
