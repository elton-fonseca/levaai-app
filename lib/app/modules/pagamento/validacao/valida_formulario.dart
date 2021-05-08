import 'package:flutter_modular/flutter_modular.dart';
import 'package:validators/validators.dart';

import '../../../core/models/pagamento.dart';
import '../../../core/services/validadores.dart';
import '../pagamento_controller.dart';

class ValidaFormulario {
  Pagamento pagamento;

  String validar() {
    pagamento = Modular.get<PagamentoController>().pagamento;

    var resultado = '';

    if (pagamento.tipoPagamento == 'cartao') {
      resultado += _numeroCartao();
      resultado += _nome();
      resultado += _codigoSeguranca();
      resultado += _validade();
      resultado += _endereco();
      resultado += _enderecoNumero();
      resultado += _enderecoCep();
    }

    return resultado;
  }

  String _nome() {
    if (pagamento.nome == null || pagamento.nome.isEmpty) {
      return 'Informe o Nome\n';
    }

    return '';
  }

  String _numeroCartao() {
    if (pagamento.numeroCartao == null || pagamento.numeroCartao.isEmpty) {
      return 'Informe o Número do Cartão\n';
    }

    var numeroCartao = Validadores.limpaMascara(pagamento.numeroCartao);

    if (!isCreditCard(numeroCartao)) {
      return 'Informe um Cartão de Credito Valido\n';
    }

    return '';
  }

  String _validade() {
    if (pagamento.validade == null || pagamento.validade.isEmpty) {
      return 'Informe a validade do Cartão\n';
    }

    if (pagamento.validade.length < 5) {
      return 'Informe Corretamente a Validade\n';
    }

    return '';
  }

  String _codigoSeguranca() {
    if (pagamento.codigoSeguranca == null ||
        pagamento.codigoSeguranca.isEmpty) {
      return 'Informe o Código de segurança\n';
    }

    if (pagamento.codigoSeguranca.length < 3) {
      return 'Informe o Código de segurança Valido\n';
    }

    return '';
  }

  String _endereco() {
    if (pagamento.logradouroFaturamento == null ||
        pagamento.logradouroFaturamento.isEmpty ||
        pagamento.cidadeFaturamento == null ||
        pagamento.cidadeFaturamento.isEmpty) {
      return 'Informe o endereço corretamente\n';
    }

    return '';
  }

  String _enderecoNumero() {
    if (pagamento.numeroFaturamento == null ||
        pagamento.numeroFaturamento.isEmpty) {
      return 'Informe o número no endereço\n';
    }

    return '';
  }

  String _enderecoCep() {
    if (pagamento.cepFaturamento == null || pagamento.cepFaturamento.isEmpty) {
      return 'Informe o CEP no endereço\n';
    }

    if (pagamento.cepFaturamento.length != 9) {
      return 'Informe o CEP corretamente\n';
    }

    return '';
  }
}
