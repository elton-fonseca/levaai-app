import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../main.dart';
import 'formulario_controller.dart';
import 'formulario_page.dart';

mixin FormularioInputs on ModularState<FormularioPage, FormularioController> {
  final myController = TextEditingController();

  @override
  void initState() {
    if (widget.acao == 'criar') {
      pedidoListaStore.addPedido();
    } else {
      myController.text = pedidoListaStore.pedidos[widget.id].enderecoOrigem;
    }

    super.initState();
  }
}
