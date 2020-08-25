import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text('pedido rastreamento'),
          FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Ir para pagamento",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            onPressed: () {
              Modular.to.pushNamed('/pagamento');
            },
          ),
        ],
      ),
    );
  }
}
