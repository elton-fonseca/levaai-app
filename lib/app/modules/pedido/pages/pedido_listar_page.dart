import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../pedido_controller.dart';

class PedidoListarPage extends StatefulWidget {
  final String title;
  const PedidoListarPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoListarPageState createState() => _PedidoListarPageState();
}

class _PedidoListarPageState
    extends ModularState<PedidoListarPage, PedidoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listar'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
