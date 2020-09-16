import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/Stores/pedido_lista_store.dart';
import 'formulario_controller.dart';
import 'formulario_page.dart';

mixin FormularioInputs on ModularState<FormularioPage, FormularioController> {
  final myController = TextEditingController();

  @override
  void initState() {
    controller.indice = widget.id;

    if (widget.acao == 'criar') {
      Modular.get<PedidoListaStore>().addPedido();
    } else {
      myController.text =
          Modular.get<PedidoListaStore>().pedidos[widget.id].enderecoOrigem;
    }

    super.initState();
  }
}
