import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/tema/cores_const.dart';
import '../../core/view/conteudo_padrao.dart';
import '../../core/view/menu_lateral.dart';
import '../../core/view/navbar_padrao.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'pagamento_controller.dart';
import 'pagamento_dropdown.dart';

class PagamentoPage extends StatefulWidget {
  final String title;
  const PagamentoPage({Key key, this.title = "Pagamento"}) : super(key: key);

  @override
  _PagamentoPageState createState() => _PagamentoPageState();
}

class _PagamentoPageState
    extends ModularState<PagamentoPage, PagamentoController> {
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
                Padding(
                  padding: EdgeInsets.only(
                      bottom: displayHeight(context) * 0.03,
                      top: displayHeight(context) * 0.04),
                  child: SizedBox(
                    height: displayHeight(context) * 0.06,
                    width: displayWidth(context) * 0.8,
                    child: Text(
                      'Preencha abaixo os \ndados para pagamento:',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: displayWidth(context) * 0.04,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
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
                      SizedBox(height: displayHeight(context) * 0.02),
                      Padding(
                        padding: EdgeInsets.only(
                          top: displayHeight(context) * 0.03,
                          left: displayWidth(context) * 0.05,
                          right: displayWidth(context) * 0.05,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                child: DropdownPagamento(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: displayHeight(context) * 0.03,
                          left: displayWidth(context) * 0.05,
                          right: displayWidth(context) * 0.05,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontSize: displayWidth(context) * 0.04,
                                  ),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700],
                                        width: 4,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: 'Nome (mesmo do cartao)',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.grey[400],
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: displayHeight(context) * 0.03,
                          left: displayWidth(context) * 0.05,
                          right: displayWidth(context) * 0.05,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontSize: displayWidth(context) * 0.04,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffixIcon: Image(
                                        width: displayWidth(context) * 0.05,
                                        image: AssetImage(
                                          'assets/creditcard.png',
                                        )),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700],
                                        width: 4,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: 'Número do cartão',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.grey[400],
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: displayHeight(context) * 0.03,
                          left: displayWidth(context) * 0.05,
                          right: displayWidth(context) * 0.05,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontSize: displayWidth(context) * 0.04,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700],
                                        width: 4,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: 'Código',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.grey[400],
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: displayWidth(context) * 0.05),
                            Expanded(
                              child: SizedBox(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontSize: displayWidth(context) * 0.04,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700],
                                        width: 4,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: 'Validade',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.grey[400],
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: displayWidth(context) * 0.08),
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
                              color: CoresConst.azulPadrao,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              border: Border.all(
                                width: 3,
                                color: CoresConst.azulPadrao,
                              )),
                          child: SizedBox.expand(
                            child: FlatButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Realizar o pagamento",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: displayWidth(context) * 0.04,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Modular.to.pushNamed('/pedido/destalhes');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: displayHeight(context) * 0.03),
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
                                    "Revisar o pedido",
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
                                Modular.to.pushNamed('/pedido/destalhes');
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
