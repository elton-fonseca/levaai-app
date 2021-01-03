import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/models/pedido.dart';
import '../../../../core/services/validadores.dart';
import '../cotacao_controller.dart';

class ValidaFormulario {
  ValidaFormulario(this.pedido);

  Pedido pedido;

  String validar() {
    var resultado = _responsavelColeta();
    resultado += _responsavelColetaCelular();
    resultado += _responsavelColetaDocumento();
    resultado += _responsavelEntrega();
    resultado += _responsavelEntregaCelular();
    resultado += _responsavelEntregaDocumento();

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

  String _responsavelColetaDocumento() {
    if (pedido.responsavelColetaDocumento == null || 
          pedido.responsavelColetaDocumento.isEmpty) {
      return 'Informe o Documento do Responsável pela Coleta\n';
    }

    var documento = Validadores.limpaMascara(pedido.responsavelColetaDocumento);

    if (documento.length != 11 && documento.length != 14) {
      return 'Informe Corretamente o Documento do Responsável pela Coleta\n';
    }

    if (documento.length == 14) {
      if (!Validadores.cnpj(documento)) {
        return 'Informe corretamente o CNPJ do Responsável pela Coleta\n';
      }
    } else {
      if (!Validadores.cpf(documento)) {
        return 'Informe corretamente o CPF do Responsável pela Coleta\n';
      }
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

  String _responsavelEntregaDocumento() {
    if (pedido.responsavelEntregaDocumento == null || 
          pedido.responsavelEntregaDocumento.isEmpty) {
      return 'Informe o Documento do Responsável pela Entrega\n';
    }

    var documento =
        Validadores.limpaMascara(pedido.responsavelEntregaDocumento);

    if (documento.length != 11 && documento.length != 14) {
      return 'Informe Corretamente o Documento do Responsável pela Entrega\n';
    }

    if (documento.length == 14) {
      if (!Validadores.cnpj(documento)) {
        return 'Informe corretamente o CNPJ do Responsável pela Entrega\n';
      }
    } else {
      if (!Validadores.cpf(documento)) {
        return 'Informe corretamente o CPF do Responsável pela Entrega\n';
      }
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
