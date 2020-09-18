import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/Stores/pedido_lista_store.dart';
import 'validacao/valida_formulario.dart';

part 'cotacao_controller.g.dart';

@Injectable()
class CotacaoController = _CotacaoControllerBase with _$CotacaoController;

abstract class _CotacaoControllerBase with Store {
  int indice = 0;

  void enviar(BuildContext context, String acao) {
    var pedido = Modular.get<PedidoListaStore>().pedidos[indice];
    var validacao = ValidaFormulario(pedido).validar();

    if (validacao.isEmpty) {
      Modular.to
          .popUntil(ModalRoute.withName('/pedido/formulario/$indice/$acao'));
      Modular.to.popAndPushNamed('/pedido/lista');
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
    Modular.get<PedidoListaStore>().pedidos[indice].responsavelColeta =
        novoResponsavelColeta;
  }

  String pegaResponsavelColeta() {
    return Modular.get<PedidoListaStore>().pedidos[indice].responsavelColeta;
  }

  @action
  void defineResponsavelColetaCelular(String novoResponsavelColetaCelular) {
    Modular.get<PedidoListaStore>().pedidos[indice].responsavelColetaCelular =
        novoResponsavelColetaCelular;
  }

  String pegaResponsavelColetaCelular() {
    return Modular.get<PedidoListaStore>()
        .pedidos[indice]
        .responsavelColetaCelular;
  }

  @action
  void defineResponsavelEntrega(String novoResponsavelEntrega) {
    Modular.get<PedidoListaStore>().pedidos[indice].responsavelEntrega =
        novoResponsavelEntrega;
  }

  String pegaResponsavelEntrega() {
    return Modular.get<PedidoListaStore>().pedidos[indice].responsavelEntrega;
  }

  @action
  void defineResponsavelEntregaCelular(String novoResponsavelEntregaCelular) {
    Modular.get<PedidoListaStore>().pedidos[indice].responsavelEntregaCelular =
        novoResponsavelEntregaCelular;
  }

  String pegaResponsavelEntregaCelular() {
    return Modular.get<PedidoListaStore>()
        .pedidos[indice]
        .responsavelEntregaCelular;
  }

  @action
  void defineObservacao(String novaObservacao) {
    Modular.get<PedidoListaStore>().pedidos[indice].observacao = novaObservacao;
  }

  String pegaObservacao() {
    return Modular.get<PedidoListaStore>().pedidos[indice].observacao;
  }
}
