import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/Stores/pedido_lista_store.dart';

part 'endereco_controller.g.dart';

@Injectable()
class EnderecoController = _EnderecoControllerBase with _$EnderecoController;

abstract class _EnderecoControllerBase with Store {
  int indice = 0;

  @action
  void defineEnderecoOrigem(String novoEnderecoOrigem) {
    Modular.get<PedidoListaStore>().pedidos[indice].enderecoOrigem =
        novoEnderecoOrigem;
  }

  String pegaEnderecoOrigem() {
    return Modular.get<PedidoListaStore>().pedidos[indice].enderecoOrigem;
  }

  @action
  void defineEnderecoDestino(String novoEnderecoDestino) {
    Modular.get<PedidoListaStore>().pedidos[indice].enderecoDestino =
        novoEnderecoDestino;
  }

  String pegaEnderecoDestino() {
    return Modular.get<PedidoListaStore>().pedidos[indice].enderecoDestino;
  }
}
