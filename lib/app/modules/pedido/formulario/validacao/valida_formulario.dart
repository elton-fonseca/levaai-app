import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/models/pedido.dart';
import '../../../../core/repositories/monitoramento_repository.dart';
import '../widgets/tipo_medida/medida_exata.dart';
import '../widgets/tipo_medida/medida_relativa.dart';

class ValidaFormulario {
  ValidaFormulario(this.pedido);

  Pedido pedido;

  String validar() {
    var resultado = _enderecoOrigem();
    resultado += _enderecoDestino();
    resultado += _itens();
    resultado += _valorTotal();
    resultado += _pesoTotal();
    resultado += _pesoTotalMaximoMedidaExata();
    resultado += _tipo();

    return resultado;
  }

  String _enderecoOrigem() {
    if (pedido.cepOrigem == null || pedido.cepOrigem == '') {
      return 'Informe o CEP de coleta\n';
    }

    if (pedido.cepOrigem.length != 9) {
      return 'Informe o CEP de coleta corretamente\n';
    }

    if (pedido.logradouroOrigem == null || pedido.logradouroOrigem == '') {
      return 'Informe o logradouro de coleta\n';
    }

    if (pedido.numeroOrigem == null || pedido.numeroOrigem == '') {
      return 'Informe o número no endereço de coleta\n';
    }

    if (pedido.bairroOrigem == null || pedido.bairroOrigem == '') {
      return 'Informe o bairro de coleta\n';
    }

    if (pedido.ibgeOrigem == null) {
      return 'Informe a cidade de coleta\n';
    }

    return '';
  }

  String _enderecoDestino() {
    if (pedido.cepDestino == null || pedido.cepDestino == '') {
      return 'Informe o CEP de entrega\n';
    }

    if (pedido.cepDestino.length != 9) {
      return 'Informe o CEP de entrega corretamente\n';
    }

    if (pedido.logradouroDestino == null || pedido.logradouroDestino == '') {
      return 'Informe o logradouro de entrega\n';
    }

    if (pedido.numeroDestino == null || pedido.numeroDestino == '') {
      return 'Informe o número no endereço de entrega\n';
    }

    if (pedido.bairroDestino == null || pedido.bairroDestino == '') {
      return 'Informe o bairro de entrega\n';
    }

    if (pedido.ibgeDestino == null) {
      return 'Informe a cidade de entrega\n';
    }

    return '';
  }

  String _itens() {
    var tamanho = pedido.itens.length;
    var tipoDeMedida = pedido.tipoDeMedida;
    var mensagem = 'Adicione ao Menos 1 Item\n';

    if (tamanho == 0 && tipoDeMedida is MedidaExata) {
      return mensagem;
    }

    if (tipoDeMedida is MedidaRelativa) {
      if (pedido.caixaSapato == 0 &&
          pedido.microondas == 0 &&
          pedido.fogao == 0 &&
          pedido.geladeira == 0) {
        return mensagem;
      }
    }

    return '';
  }

  String _valorTotal() {
    if (pedido.valorTotal == null || pedido.valorTotal == 0) {
      return 'Informe o Valor dos Itens\n';
    }

    return '';
  }

  String _pesoTotal() {
    if (pedido.pesoTotal == null ||
        pedido.pesoTotal == 'peso-exato' ||
        pedido.pesoTotal == 'selecione' ||
        pedido.pesoTotal == '0') {
      return 'Informe o Peso dos Itens\n';
    } else {
      return _pesoTotalMaximoMedidaRelativa();
    }
  }

  String _pesoTotalMaximoMedidaRelativa() {
    if (pedido.tipoDeMedida is MedidaRelativa) {
      var quantidadeItens = pedido.caixaSapato;
      quantidadeItens += pedido.microondas;
      quantidadeItens += pedido.fogao;
      quantidadeItens += pedido.geladeira;

      var pesoInformado = int.parse(pedido.pesoTotal);
      var pesoPorItem = pesoInformado / quantidadeItens;

      if (pesoPorItem > 80) {
        Modular.get<MonitoramentoRepository>().registrarAcao('peso_superior');

        return 'Peso maior do que o permitido\n';
      }
    }

    return '';
  }

  String _pesoTotalMaximoMedidaExata() {
    if (pedido.tipoDeMedida is MedidaExata) {
      var quantidadeItens = 0;

      // ignore: avoid_function_literals_in_foreach_calls
      pedido.itens.forEach((element) => quantidadeItens += element.quantidade);

      var pesoInformado = int.parse(pedido.pesoTotal);
      var pesoPorItem = pesoInformado / quantidadeItens;

      if (pesoPorItem > 80) {
        Modular.get<MonitoramentoRepository>().registrarAcao('peso_superior');

        return 'Peso maior do que o permitido\n';
      }
    }

    return '';
  }

  String _tipo() {
    if (pedido.tipoMercadoria == null) {
      return 'Informe o Tipo dos Itens\n';
    }

    return '';
  }
}
