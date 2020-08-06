import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../../../core/tema/cores_const.dart';
import '../controllers/pedido_form_controller.dart';

class PedidoFormPage extends StatefulWidget {
  final String title;
  const PedidoFormPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoFormPageState createState() => _PedidoFormPageState();
}

class _PedidoFormPageState
    extends ModularState<PedidoFormPage, PedidoFormController> {
  //use 'controller' variable to access controller

  final _itens = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: NavbarPadrao().build(context),
        backgroundColor: CoresConst.azulPadrao,
        body: 
      ),
    );
  }
}
