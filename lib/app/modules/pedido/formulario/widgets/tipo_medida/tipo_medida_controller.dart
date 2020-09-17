import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/Stores/pedido_lista_store.dart';
import 'medida_exata.dart';
import 'medida_relativa.dart';

part 'tipo_medida_controller.g.dart';

@Injectable()
class TipoMedidaController = _TipoMedidaControllerBase
    with _$TipoMedidaController;

abstract class _TipoMedidaControllerBase with Store {
  int indice = 0;

  //tipo de medida
  @action
  void definirMedidaRelativa() {
    Modular.get<PedidoListaStore>().pedidos[indice].tipoDeMedida =
        MedidaRelativa();
  }

  @action
  void definirMedidaExata() {
    Modular.get<PedidoListaStore>().pedidos[indice].tipoDeMedida =
        MedidaExata();
  }

  String descritivoTipoDeMedida() {
    var tipoMedida =
        Modular.get<PedidoListaStore>().pedidos[indice].tipoDeMedida;

    if (tipoMedida is MedidaRelativa) {
      return "Tenho as Medidas Exatas";
    }

    return "Adicionar Item";
  }

  Widget pegarTipoDeMedida() {
    return Modular.get<PedidoListaStore>().pedidos[indice].tipoDeMedida;
  }

  //contadores medida relativa
  int itemCaixaSapato() {
    return Modular.get<PedidoListaStore>().pedidos[indice].caixaSapato;
  }

  @action
  void addItemCaixaSapato() {
    Modular.get<PedidoListaStore>().pedidos[indice].caixaSapato++;
  }

  @action
  void rmItemCaixaSapato() {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].caixaSapato;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].caixaSapato--;
    }
  }

  int itemMicroondas() {
    return Modular.get<PedidoListaStore>().pedidos[indice].microondas;
  }

  @action
  void addItemMicroondas() {
    Modular.get<PedidoListaStore>().pedidos[indice].microondas++;
  }

  @action
  void rmItemMicroondas() {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].microondas;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].microondas--;
    }
  }

  int itemFogao() {
    return Modular.get<PedidoListaStore>().pedidos[indice].fogao;
  }

  @action
  void addItemFogao() {
    Modular.get<PedidoListaStore>().pedidos[indice].fogao++;
  }

  @action
  void rmItemFogao() {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].fogao;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].fogao--;
    }
  }

  int itemGeladeira() {
    return Modular.get<PedidoListaStore>().pedidos[indice].geladeira;
  }

  @action
  void addItemGeladeira() {
    Modular.get<PedidoListaStore>().pedidos[indice].geladeira++;
  }

  @action
  void rmItemGeladeira() {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].geladeira;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].geladeira--;
    }
  }

  //medida exata
  ObservableList pegarListaMedidaExata() {
    return Modular.get<PedidoListaStore>().pedidos[indice].itens;
  }
}
