import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/tema/cores_const.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../controllers/pedido_form_controller.dart';

class PedidoDetalhesPage extends StatefulWidget {
  final String title;
  const PedidoDetalhesPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoDetalhesPageState createState() => _PedidoDetalhesPageState();
}

class _PedidoDetalhesPageState
    extends ModularState<PedidoDetalhesPage, PedidoFormController> {
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
              'Total Geral',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: displayWidth(context) * 0.04,
              ),
            ),
            Text(
              'R\$1200,00',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: displayWidth(context) * 0.09,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        conteudo: SizedBox(
          width: displayWidth(context) * 0.7,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: displayHeight(context) * 0.235,
                    width: displayHeight(context) * 0.235,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.04,
                              bottom: displayWidth(context) * 0.01,
                              top: displayWidth(context) * 0.02),
                          child: Text(
                            'Pedido #1',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey[500],
                              fontSize: displayWidth(context) * 0.04,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: displayWidth(context) * 0.05),
                          child: Container(
                            height: displayHeight(context) * 0.05,
                            decoration: BoxDecoration(
                              color: Color(0xFFf7f9f8),
                              borderRadius: BorderRadius.only(
                                topRight: const Radius.circular(40.0),
                                bottomRight: const Radius.circular(40.0),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.monetization_on,
                                      color: Colors.yellow[800]),
                                  iconSize: displayWidth(context) * 0.06,
                                  onPressed: () {
                                    null;
                                  },
                                ),
                                Text(
                                  'R\$200,00',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: CoresConst.azulPadrao,
                                    fontSize: displayWidth(context) * 0.045,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.04,
                              top: displayWidth(context) * 0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Destinatário:',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                              Text(
                                'Nome Sobrenome',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                              Text(
                                'CEP 12342-000',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.only(bottom: 0),
                                icon: Icon(Icons.delete),
                                iconSize: displayWidth(context) * 0.07,
                                onPressed: null)
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: displayHeight(context) * 0.235,
                    width: displayHeight(context) * 0.235,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.04,
                              bottom: displayWidth(context) * 0.01,
                              top: displayWidth(context) * 0.02),
                          child: Text(
                            'Pedido #1',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey[500],
                              fontSize: displayWidth(context) * 0.04,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: displayWidth(context) * 0.05),
                          child: Container(
                            height: displayHeight(context) * 0.05,
                            decoration: BoxDecoration(
                              color: Color(0xFFf7f9f8),
                              borderRadius: BorderRadius.only(
                                topRight: const Radius.circular(40.0),
                                bottomRight: const Radius.circular(40.0),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.monetization_on,
                                      color: Colors.yellow[800]),
                                  iconSize: displayWidth(context) * 0.06,
                                  onPressed: () {
                                    null;
                                  },
                                ),
                                Text(
                                  'R\$200,00',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: CoresConst.azulPadrao,
                                    fontSize: displayWidth(context) * 0.045,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.04,
                              top: displayWidth(context) * 0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Destinatário:',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                              Text(
                                'Nome Sobrenome',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                              Text(
                                'CEP 12342-000',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.only(bottom: 0),
                                icon: Icon(Icons.delete),
                                iconSize: displayWidth(context) * 0.07,
                                onPressed: null)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                                    Container(
                    height: displayHeight(context) * 0.235,
                    width: displayHeight(context) * 0.235,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.04,
                              bottom: displayWidth(context) * 0.01,
                              top: displayWidth(context) * 0.02),
                          child: Text(
                            'Pedido #1',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey[500],
                              fontSize: displayWidth(context) * 0.04,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: displayWidth(context) * 0.05),
                          child: Container(
                            height: displayHeight(context) * 0.05,
                            decoration: BoxDecoration(
                              color: Color(0xFFf7f9f8),
                              borderRadius: BorderRadius.only(
                                topRight: const Radius.circular(40.0),
                                bottomRight: const Radius.circular(40.0),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.monetization_on,
                                      color: Colors.yellow[800]),
                                  iconSize: displayWidth(context) * 0.06,
                                  onPressed: () {
                                    null;
                                  },
                                ),
                                Text(
                                  'R\$200,00',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: CoresConst.azulPadrao,
                                    fontSize: displayWidth(context) * 0.045,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.04,
                              top: displayWidth(context) * 0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Destinatário:',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                              Text(
                                'Nome Sobrenome',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                              Text(
                                'CEP 12342-000',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.only(bottom: 0),
                                icon: Icon(Icons.delete),
                                iconSize: displayWidth(context) * 0.07,
                                onPressed: null)
                          ],
                        )
                      ],
                    ),
                  ),
                                    Container(
                    height: displayHeight(context) * 0.235,
                    width: displayHeight(context) * 0.235,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.04,
                              bottom: displayWidth(context) * 0.01,
                              top: displayWidth(context) * 0.02),
                          child: Text(
                            'Pedido #1',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey[500],
                              fontSize: displayWidth(context) * 0.04,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: displayWidth(context) * 0.05),
                          child: Container(
                            height: displayHeight(context) * 0.05,
                            decoration: BoxDecoration(
                              color: Color(0xFFf7f9f8),
                              borderRadius: BorderRadius.only(
                                topRight: const Radius.circular(40.0),
                                bottomRight: const Radius.circular(40.0),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.monetization_on,
                                      color: Colors.yellow[800]),
                                  iconSize: displayWidth(context) * 0.06,
                                  onPressed: () {
                                    null;
                                  },
                                ),
                                Text(
                                  'R\$200,00',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: CoresConst.azulPadrao,
                                    fontSize: displayWidth(context) * 0.045,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.04,
                              top: displayWidth(context) * 0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Destinatário:',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                              Text(
                                'Nome Sobrenome',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                              Text(
                                'CEP 12342-000',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.only(bottom: 0),
                                icon: Icon(Icons.delete),
                                iconSize: displayWidth(context) * 0.07,
                                onPressed: null)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: displayHeight(context) * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: displayWidth(context) * 0.7,
                    height: displayHeight(context) * 0.07,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: CoresConst.verdepadrao,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        border: Border.all(
                          width: 3,
                          color: CoresConst.verdepadrao,
                        )),
                    child: SizedBox.expand(
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Ir para pagamento",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: displayWidth(context) * 0.04,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onPressed: () {
                          Modular.to.pushNamed('/usuario/cadastro');
                        },
                      ),
                    ),
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
