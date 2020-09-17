import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/Stores/pedido_lista_store.dart';
import 'formulario_controller.dart';
import 'formulario_page.dart';
import 'widgets/detalhes/detalhes_controller.dart';
import 'widgets/endereco/endereco_controller.dart';
import 'widgets/popup/popup_controller.dart';
import 'widgets/tipo_medida/tipo_medida_controller.dart';

mixin FormularioInputs on ModularState<FormularioPage, FormularioController> {
  final enderecoOrigemTextController = TextEditingController();
  final enderecoDestinoTextController = TextEditingController();
  final valorTotalTextController = TextEditingController();

  @override
  void initState() {
    controller.indice = widget.id;
    Modular.get<TipoMedidaController>().indice = widget.id;
    Modular.get<PopupController>().indice = widget.id;
    Modular.get<EnderecoController>().indice = widget.id;
    Modular.get<DetalhesController>().indice = widget.id;
    

    if (widget.acao == 'criar') {
      Modular.get<PedidoListaStore>().addPedido();
    } else {
      enderecoOrigemTextController.text =
          Modular.get<EnderecoController>().pegaEnderecoOrigem();

      enderecoDestinoTextController.text =
          Modular.get<EnderecoController>().pegaEnderecoDestino();

      valorTotalTextController.text =
          Modular.get<DetalhesController>().pegaValorTotal();
    }

    super.initState();
  }
}
