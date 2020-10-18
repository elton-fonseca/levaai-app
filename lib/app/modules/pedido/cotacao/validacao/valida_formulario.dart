import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/models/pedido.dart';
import '../cotacao_controller.dart';

class ValidaFormulario {
  ValidaFormulario(this.pedido);

  Pedido pedido;

  String validar() {
    var resultado = _responsavelColeta();
    resultado += _responsavelColetaCelular();
    resultado += _responsavelEntrega();
    resultado += _responsavelEntregaCelular();
    resultado += _verificaCotacaoId();

    return resultado;
  }

  String _responsavelColeta() {
    if (pedido.responsavelColeta == null || pedido.responsavelColeta.isEmpty) {
      return 'Informe o Responsável pela Coleta\n';
    }

    return '';
  }

  String _responsavelColetaCelular() {
    if (pedido.responsavelColetaCelular == null ||
        pedido.responsavelColetaCelular.isEmpty) {
      return 'Informe o Celular do Responsável pela Coleta\n';
    }

    if (pedido.responsavelColetaCelular.length < 15) {
      return 'Informe Corretamente o Celular do Responsável pela Coleta\n';
    }

    return '';
  }

  String _responsavelEntrega() {
    if (pedido.responsavelEntrega == null ||
        pedido.responsavelEntrega.isEmpty) {
      return 'Informe o Responsável pela Entrega\n';
    }

    return '';
  }

  String _responsavelEntregaCelular() {
    if (pedido.responsavelEntregaCelular == null ||
        pedido.responsavelEntregaCelular.isEmpty) {
      return 'Informe o Celular do Responsável pela Entrega\n';
    }

    if (pedido.responsavelEntregaCelular.length < 15) {
      return 'Informe Corretamente o Celular do Responsável pela Coleta\n';
    }

    return '';
  }

  String _verificaCotacaoId() {
    if (Modular.get<CotacaoController>().cotacaoId == null) {
      return 'Erro na cotação. Volte na tela de detalhes e verifique os dados';
    }

    return '';
  }
}
