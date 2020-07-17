import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../pedido_controller.dart';

class PedidoCotacaoPage extends StatefulWidget {
  final String title;
  const PedidoCotacaoPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoCotacaoPageState createState() => _PedidoCotacaoPageState();
}

class _PedidoCotacaoPageState
    extends ModularState<PedidoCotacaoPage, PedidoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cotacao'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
