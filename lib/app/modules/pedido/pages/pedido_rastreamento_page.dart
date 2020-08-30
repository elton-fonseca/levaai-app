import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/tema/cores_const.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/menu_lateral.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../controllers/pedido_form_controller.dart';

class PedidoRastreamentoPage extends StatefulWidget {
  final String title;
  const PedidoRastreamentoPage({Key key, this.title = "Login"})
      : super(key: key);

  @override
  _PedidoRastreamentoPageState createState() => _PedidoRastreamentoPageState();
}

class _PedidoRastreamentoPageState
    extends ModularState<PedidoRastreamentoPage, PedidoFormController> {
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
                    Padding(
                      padding: EdgeInsets.only(
                        top: displayHeight(context) * 0.05,
                        left: displayWidth(context) * 0.05,
                        right: displayWidth(context) * 0.05,
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
                                right: displayWidth(context) * 0.1),
                            child: SizedBox(
                              height: displayHeight(context) * 0.03,
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
                              left: displayWidth(context) * 0.05,
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
                              left: displayWidth(context) * 0.05,
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
                              left: displayWidth(context) * 0.05,
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
                              left: displayWidth(context) * 0.05,
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
                              left: displayWidth(context) * 0.1),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                child: Icon(Icons.check_circle,
                                    size: displayWidth(context) * 0.12,
                                    color: Color(0xFF95c330)),
                              )
                            ],
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
                      width: displayWidth(context) * 0.9,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              left: displayWidth(context) * 0.1,
                              right: displayWidth(context) * 0.1,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              left: displayWidth(context) * 0.1,
                              right: displayWidth(context) * 0.1,
                              bottom: displayWidth(context) * 0.05,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            width: displayWidth(context) * 0.8,
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
                              left: displayWidth(context) * 0.1,
                              right: displayWidth(context) * 0.1,
                              top: displayWidth(context) * 0.05,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              left: displayWidth(context) * 0.1,
                              right: displayWidth(context) * 0.1,
                              bottom: displayWidth(context) * 0.05,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            width: displayWidth(context) * 0.8,
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
                              left: displayWidth(context) * 0.1,
                              right: displayWidth(context) * 0.1,
                              top: displayWidth(context) * 0.05,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              left: displayWidth(context) * 0.1,
                              right: displayWidth(context) * 0.1,
                              bottom: displayWidth(context) * 0.05,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
