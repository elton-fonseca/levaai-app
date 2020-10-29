import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/stores/pedido_lista_store.dart';
import 'validacao/valida_formulario.dart';

part 'cotacao_controller.g.dart';

@Injectable()
class CotacaoController = _CotacaoControllerBase with _$CotacaoController;

abstract class _CotacaoControllerBase with Store {
  _CotacaoControllerBase(this.pedidoLista);

  PedidoListaStore pedidoLista;

  int indice = 0;
  String acao;

  double cotacaoValor;
  int cotacaoId;

  void enviar(BuildContext context, String acao) {
    var pedido = pedidoLista.pedidos[indice];
    var validacao = ValidaFormulario(pedido).validar();

    if (validacao.isEmpty) {
      if (acao == 'editar') {
        pedidoLista.valorTotalPedidos -= pedido.valorCotacao;
      }
      pedido.valorCotacao = cotacaoValor;
      pedido.cotacaoId = cotacaoId;
      pedidoLista.valorTotalPedidos += cotacaoValor;

      if (acao == 'criar' && indice == 0) {
        Navigator.of(context)..pop()..pop();
        Modular.to.pushNamed('/pedido/lista');
      } else {
        Navigator.of(context)..pop()..pop()..pop();
        Modular.to.pushNamed('/pedido/lista');
      }
    } else {
      var scnackbar = SnackBar(
        content: Text(validacao),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 7),
      );
      Scaffold.of(context).showSnackBar(scnackbar);
    }
  }

  @action
  void defineResponsavelColeta(String novoResponsavelColeta) {
    pedidoLista.pedidos[indice].responsavelColeta = novoResponsavelColeta;
  }

  String pegaResponsavelColeta() {
    return pedidoLista.pedidos[indice].responsavelColeta;
  }

  @action
  void defineResponsavelColetaCelular(String novoResponsavelColetaCelular) {
    pedidoLista.pedidos[indice].responsavelColetaCelular =
        novoResponsavelColetaCelular;
  }

  String pegaResponsavelColetaCelular() {
    return pedidoLista.pedidos[indice].responsavelColetaCelular;
  }

  @action
  void defineResponsavelColetaDocumento(
    String novoResponsavelColetaDocumento,
    MaskedTextController textController,
  ) {
    var mascara;
    if (novoResponsavelColetaDocumento.length > 14) {
      mascara = '00.000.000/0000-00';
    } else {
      mascara = '000.000.000-00';
    }

    textController.updateMask(mascara);
    pedidoLista.pedidos[indice].responsavelColetaDocumento =
        novoResponsavelColetaDocumento;
  }

  String pegaResponsavelColetaDocumento(MaskedTextController textController) {
    var documento = pedidoLista.pedidos[indice].responsavelColetaDocumento;
    var cpf = '000.000.000-00';
    var mascara;

    if (documento == null) {
      return '';
    }

    if (documento.length > 14) {
      mascara = '00.000.000/0000-00';
    } else {
      mascara = cpf;
    }

    textController.updateMask(mascara);

    return documento;
  }

  @action
  void defineResponsavelEntrega(String novoResponsavelEntrega) {
    pedidoLista.pedidos[indice].responsavelEntrega = novoResponsavelEntrega;
  }

  String pegaResponsavelEntrega() {
    return pedidoLista.pedidos[indice].responsavelEntrega;
  }

  @action
  void defineResponsavelEntregaCelular(String novoResponsavelEntregaCelular) {
    pedidoLista.pedidos[indice].responsavelEntregaCelular =
        novoResponsavelEntregaCelular;
  }

  String pegaResponsavelEntregaCelular() {
    return pedidoLista.pedidos[indice].responsavelEntregaCelular;
  }

  @action
  void defineResponsavelEntregaDocumento(
    String novoResponsavelEntregaDocumento,
    MaskedTextController textController,
  ) {
    var mascara;
    if (novoResponsavelEntregaDocumento.length > 14) {
      mascara = '00.000.000/0000-00';
    } else {
      mascara = '000.000.000-00';
    }

    textController.updateMask(mascara);

    pedidoLista.pedidos[indice].responsavelEntregaDocumento =
        novoResponsavelEntregaDocumento;
  }

  String pegaResponsavelEntregaDocumento(MaskedTextController textController) {
    var documento = pedidoLista.pedidos[indice].responsavelEntregaDocumento;
    var cpf = '000.000.000-00';
    var mascara;

    if (documento == null) {
      return '';
    }

    if (documento.length > 14) {
      mascara = '00.000.000/0000-00';
    } else {
      mascara = cpf;
    }

    textController.updateMask(mascara);

    return documento;
  }

  @action
  void defineObservacao(String novaObservacao) {
    pedidoLista.pedidos[indice].observacao = novaObservacao;
  }

  String pegaObservacao() {
    return pedidoLista.pedidos[indice].observacao;
  }
}
