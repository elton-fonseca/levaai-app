import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/view/botao_azul.dart';
import '../controllers/pedido_form_controller.dart';
import 'widgets/medida_relativa.dart';

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
      appBar: AppBar(
        title: Text('form'),
      ),
      body: Column(
        children: <Widget>[
          Text('aaa'),
          Observer(
            builder: (_) => Modular.get<PedidoFormController>().tipoDeMedida,
          ),
          BotaoAzul(
            onClick: () {
              Modular.get<PedidoFormController>().definirMedidaExata();
            },
          ),
        ],
      ),
    );
  }
}
