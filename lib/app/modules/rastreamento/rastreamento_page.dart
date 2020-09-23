import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/tema/cores_const.dart';
import '../../core/view/botao_azul.dart';
import '../../core/view/conteudo_padrao.dart';
import '../../core/view/menu_lateral.dart';
import '../../core/view/navbar_padrao.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'lista_pedidos.dart';
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
                SizedBox(height: displayHeight(context) * 0.03),
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
                      ListaPedidos(),
                    ],
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BotaoAzul(
                          onClick: () {
                            Modular.to.pushNamed("pedido/formulario/0/criar");
                          },
                          texto: "Novo Pedido",
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: displayHeight(context) * 0.062),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
