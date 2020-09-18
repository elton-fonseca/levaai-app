import '../../../../core/Models/pedido.dart';
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
    resultado += _tipo();

    return resultado;
  }

  String _enderecoOrigem() {
    if (pedido.enderecoOrigem == null) {
      return 'Informe o Endereço de Origem\n';
    }

    return '';
  }

  String _enderecoDestino() {
    if (pedido.enderecoDestino == null) {
      return 'Informe o Endereço de Destino\n';
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
    if (pedido.valorTotal == null || pedido.valorTotal.isEmpty) {
      return 'Informe o Valor dos Itens\n';
    }

    return '';
  }

  String _pesoTotal() {
    if (pedido.pesoTotal == null || pedido.pesoTotal == 'selecione') {
      return 'Informe o Peso dos Itens\n';
    }

    return '';
  }

  String _tipo() {
    if (pedido.tipoMercadoria == null || pedido.tipoMercadoria == 'selecione') {
      return 'Informe o Tipo dos Itens\n';
    }

    return '';
  }
}
