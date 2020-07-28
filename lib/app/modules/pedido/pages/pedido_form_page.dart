import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../pedido_controller.dart';

class PedidoFormPage extends StatefulWidget {
  final String title;
  const PedidoFormPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoFormPageState createState() => _PedidoFormPageState();
}

class _PedidoFormPageState
    extends ModularState<PedidoFormPage, PedidoController> {
  //use 'controller' variable to access controller

  final itens = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
