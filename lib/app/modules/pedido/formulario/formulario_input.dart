import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/core/Stores/pedido_lista_store.dart';

import '../../../../main.dart';
import 'formulario_controller.dart';
import 'formulario_page.dart';

mixin FormularioInputs on ModularState<FormularioPage, FormularioController> {
  final myController = TextEditingController();

  @override
  void initState() {
    if (widget.acao == 'criar') {
      Modular.get<PedidoListaStore>().addPedido();
    } else {
      myController.text =
          Modular.get<PedidoListaStore>().pedidos[widget.id].enderecoOrigem;
    }

    super.initState();
  }
}
