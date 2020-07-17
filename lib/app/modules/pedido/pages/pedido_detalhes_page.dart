import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../pedido_controller.dart';

class PedidoDetalhesPage extends StatefulWidget {
  final String title;
  const PedidoDetalhesPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoDetalhesPageState createState() => _PedidoDetalhesPageState();
}

class _PedidoDetalhesPageState
    extends ModularState<PedidoDetalhesPage, PedidoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("detalhes"),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
