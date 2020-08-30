import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/tema/cores_const.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/menu_lateral.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../controllers/pedido_form_controller.dart';

class PedidoListarPage extends StatefulWidget {
  final String title;
  const PedidoListarPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoListarPageState createState() => _PedidoListarPageState();
}

class _PedidoListarPageState
    extends ModularState<PedidoListarPage, PedidoFormController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarPadrao().build(context),
      drawer: MenuLateral(),
      backgroundColor: CoresConst.azulPadrao,
      body: ConteudoPadrao(
        textoCabecalho: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Meus Pedidos',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: displayWidth(context) * 0.06,
                fontWeight: FontWeight.w900,
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
                        Modular.to.pushNamed('pedido/rastreamento');
                      },
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.04,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "Pedido #23455",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: CoresConst.azulPadrao,
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  "Destino: Avenida Paulista, 1234 "
                                  "\nSão Paulo - SP | CEP: 12345-000",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.04,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
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
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.06),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  height: displayHeight(context) * 0.03,
                                  child: Image.asset("assets/box-blue.png"),
                                ),
                                SizedBox(height: displayHeight(context) * 0.02),
                                SizedBox(
                                  height: displayHeight(context) * 0.06,
                                  child: Icon(Icons.check_circle,
                                      size: displayWidth(context) * 0.12,
                                      color: Color(0xFF98C11C)),
                                )
                              ],
                            ),
                          ),
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
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.04,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                "Pedido #23455",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: CoresConst.azulPadrao,
                                  fontSize: displayWidth(context) * 0.05,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                "Destino: Avenida Paulista, 1234 "
                                "\nSão Paulo - SP | CEP: 12345-000",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[500],
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.06),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(
                                height: displayHeight(context) * 0.03,
                                child: Image.asset("assets/box-blue.png"),
                              ),
                              SizedBox(height: displayHeight(context) * 0.02),
                              SizedBox(
                                height: displayHeight(context) * 0.06,
                                child: Icon(Icons.remove_circle,
                                    size: displayWidth(context) * 0.12,
                                    color: Color(0xFFE6B91D)),
                              )
                            ],
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
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.04,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                "Pedido #23455",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: CoresConst.azulPadrao,
                                  fontSize: displayWidth(context) * 0.05,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                "Destino: Avenida Paulista, 1234 "
                                "\nSão Paulo - SP | CEP: 12345-000",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[500],
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  left: displayWidth(context) * 0.05),
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
                              left: displayWidth(context) * 0.06),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(
                                height: displayHeight(context) * 0.03,
                                child: Image.asset("assets/box-blue.png"),
                              ),
                              SizedBox(height: displayHeight(context) * 0.02),
                              SizedBox(
                                height: displayHeight(context) * 0.06,
                                child: Icon(Icons.cancel,
                                    size: displayWidth(context) * 0.12,
                                    color: Color(0xFFC13A1C)),
                              ),
                            ],
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
    );
  }
}
