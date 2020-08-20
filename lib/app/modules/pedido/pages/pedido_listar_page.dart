import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/tema/cores_const.dart';
import '../../../core/view/conteudo_padrao.dart';
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
      backgroundColor: CoresConst.azulPadrao,
      body: ConteudoPadrao(
        textoCabecalho: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Meus Pedidos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
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
                                  fontWeight: FontWeight.w500,
                                  color: CoresConst.azulPadrao,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                "Destino: Avenida Paulista, 1234 \nSão Paulo - SP | CEP: 12345-000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[500],
                                  fontSize: 15,
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
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey[500],
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.09),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(
                                height: displayHeight(context) * 0.04,
                                child: Image.asset("assets/logo.png"),
                              ),
                              SizedBox(height: displayHeight(context) * 0.02),
                              SizedBox(
                                height: displayHeight(context) * 0.06,
                                child: Icon(Icons.check_circle,
                                    size: 40, color: Color(0xFF95c330)),
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
                                  fontWeight: FontWeight.w500,
                                  color: CoresConst.azulPadrao,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                "Destino: Avenida Paulista, 1234 \nSão Paulo - SP | CEP: 12345-000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[500],
                                  fontSize: 15,
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
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey[500],
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.09),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(
                                height: displayHeight(context) * 0.04,
                                child: Image.asset("assets/logo.png"),
                              ),
                              SizedBox(height: displayHeight(context) * 0.02),
                              SizedBox(
                                height: displayHeight(context) * 0.06,
                                child: Icon(Icons.remove_circle,
                                    size: 40, color: Color(0xFFe3ba2c)),
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
                                  fontWeight: FontWeight.w500,
                                  color: CoresConst.azulPadrao,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                "Destino: Avenida Paulista, 1234 \nSão Paulo - SP | CEP: 12345-000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[500],
                                  fontSize: 15,
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
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey[500],
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.09),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(
                                height: displayHeight(context) * 0.04,
                                child: Image.asset("assets/logo.png"),
                              ),
                              SizedBox(height: displayHeight(context) * 0.02),
                              SizedBox(
                                height: displayHeight(context) * 0.06,
                                child: Icon(Icons.cancel,
                                    size: 40, color: Color(0xFFbb3a1f)),
                              )
                            ],
                          ),
                        ),
                      ],
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
                        width: displayWidth(context) * 0.8,
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
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            onPressed: () {
                              Modular.to.pushNamed('/pedido/cotacao');
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
