import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/stores/pedido_lista_store.dart';

part 'complemento_endereco_controller.g.dart';

@Injectable()
class ComplementoEnderecoController = _ComplementoEnderecoControllerBase
    with _$ComplementoEnderecoController;

abstract class _ComplementoEnderecoControllerBase with Store {
  _ComplementoEnderecoControllerBase(this.pedidoLista);

  PedidoListaStore pedidoLista;

  int indice = 0;

  void defineComplementoEnderecoOrigem(String novoComplementoEnderecoOrigem) {
    pedidoLista.pedidos[indice].complementoOrigem =
        novoComplementoEnderecoOrigem;
  }

  String pegaComplementoEnderecoOrigem() {
    return pedidoLista.pedidos[indice].complementoOrigem;
  }

  void defineNumeroEnderecoOrigem(String novoNumeroEnderecoOrigem) {
    pedidoLista.pedidos[indice].numeroOrigem = novoNumeroEnderecoOrigem;
  }

  String pegaNumeroEnderecoOrigem() {
    return pedidoLista.pedidos[indice].numeroOrigem;
  }

  void defineComplementoEnderecoDestino(String novoComplementoEnderecoDestino) {
    pedidoLista.pedidos[indice].complementoDestino =
        novoComplementoEnderecoDestino;
  }

  String pegaComplementoEnderecoDestino() {
    return pedidoLista.pedidos[indice].complementoDestino;
  }

  void defineNumeroEnderecoDestino(String novoNumeroEnderecoDestino) {
    pedidoLista.pedidos[indice].numeroDestino = novoNumeroEnderecoDestino;
  }

  String pegaNumeroEnderecoDestino() {
    return pedidoLista.pedidos[indice].numeroDestino;
  }
}
