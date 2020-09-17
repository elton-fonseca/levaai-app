import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/modules/pedido/formulario/widgets/popup/popup_controller.dart';

import '../../../core/Stores/pedido_lista_store.dart';
import 'formulario_controller.dart';
import 'formulario_page.dart';

mixin FormularioInputs on ModularState<FormularioPage, FormularioController> {
  final enderecoOrigemTextController = TextEditingController();
  final enderecoDestinoTextController = TextEditingController();
  final valorTotalTextController = TextEditingController();

  @override
  void initState() {
    controller.indice = widget.id;
    Modular.get<PopupController>().indice = widget.id;

    if (widget.acao == 'criar') {
      Modular.get<PedidoListaStore>().addPedido();
    } else {
      enderecoOrigemTextController.text =
          Modular.get<FormularioController>().pegaEnderecoOrigem();

      enderecoDestinoTextController.text =
          Modular.get<FormularioController>().pegaEnderecoDestino();

      valorTotalTextController.text =
          Modular.get<FormularioController>().pegaValorTotal();
    }

    super.initState();
  }
}
