import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/Stores/pedido_lista_store.dart';

part 'formulario_controller.g.dart';

@Injectable()
class FormularioController = _FormularioControllerBase
    with _$FormularioController;

abstract class _FormularioControllerBase with Store {
  @action
  void addItemCaixaSapato(int indice) {
    Modular.get<PedidoListaStore>().pedidos[indice].caixaSapato++;
  }

  @action
  void rmItemCaixaSapato(int indice) {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].caixaSapato;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].caixaSapato--;
    }
  }

  @action
  void addItemMicroondas(int indice) {
    Modular.get<PedidoListaStore>().pedidos[indice].microondas++;
  }

  @action
  void rmItemMicroondas(int indice) {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].microondas;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].microondas--;
    }
  }

  @action
  void addItemFogao(int indice) {
    Modular.get<PedidoListaStore>().pedidos[indice].fogao++;
  }

  @action
  void rmItemFogao(int indice) {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].fogao;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].fogao--;
    }
  }

  @action
  void addItemGeladeira(int indice) {
    Modular.get<PedidoListaStore>().pedidos[indice].geladeira++;
  }

  @action
  void rmItemGeladeira(int indice) {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].geladeira;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].geladeira--;
    }
  }
}
