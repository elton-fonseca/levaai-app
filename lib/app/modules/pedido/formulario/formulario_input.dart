import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/repositories/monitoramento_repository.dart';
import '../../../core/stores/pedido_lista_store.dart';
import 'formulario_controller.dart';
import 'formulario_page.dart';
import 'widgets/detalhes/detalhes_controller.dart';
import 'widgets/endereco/endereco_controller.dart';
import 'widgets/popup/popup_controller.dart';
import 'widgets/tipo_medida/tipo_medida_controller.dart';

mixin FormularioInputs on ModularState<FormularioPage, FormularioController> {
  final enderecoOrigemTextController = TextEditingController();
  final enderecoDestinoTextController = TextEditingController();
  final valorTotalTextController =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  final pesoTextController =
      MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '');
  final tipoMercadoriaTextController = TextEditingController();

  @override
  void initState() {
    controller.indice = widget.id;
    Modular.get<TipoMedidaController>().indice = widget.id;
    Modular.get<PopupController>().indice = widget.id;
    Modular.get<EnderecoController>().indice = widget.id;
    Modular.get<DetalhesController>().indice = widget.id;

    //garante que a lista vai estar limpa no começo
    if (widget.acao == 'criar' && widget.id == 0) {
      Modular.get<PedidoListaStore>().limpar();
      Modular.get<PedidoListaStore>().valorTotalPedidos = 0;
    }

    if (widget.acao == 'criar') {
      Modular.get<PedidoListaStore>().addPedido();
      Modular.get<PedidoListaStore>().pedidos[widget.id].idLocal = widget.id;
    } else {
      enderecoOrigemTextController.text =
          Modular.get<EnderecoController>().pegaEnderecoOrigem();

      enderecoDestinoTextController.text =
          Modular.get<EnderecoController>().pegaEnderecoDestino();

      valorTotalTextController
          .updateValue(Modular.get<DetalhesController>().pegaValorTotal());

      tipoMercadoriaTextController.text =
          Modular.get<DetalhesController>().pegaTipoMercadoria();
    }

    controller.defineValorTotal(valorTotalTextController);
    controller.definePesoTotal(pesoTextController);

    Modular.get<MonitoramentoRepository>()
        .registrarAcao('formulario/${widget.acao}/${widget.id}');

    super.initState();
  }
}
