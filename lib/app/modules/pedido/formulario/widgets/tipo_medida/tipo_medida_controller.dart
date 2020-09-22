import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/stores/pedido_lista_store.dart';
import 'medida_exata.dart';
import 'medida_relativa.dart';

part 'tipo_medida_controller.g.dart';

@Injectable()
class TipoMedidaController = _TipoMedidaControllerBase
    with _$TipoMedidaController;

abstract class _TipoMedidaControllerBase with Store {
  _TipoMedidaControllerBase(this.pedidoLista);

  PedidoListaStore pedidoLista;

  int indice = 0;

  //tipo de medida
  @action
  void definirMedidaRelativa() {
    pedidoLista.pedidos[indice].tipoDeMedida = MedidaRelativa();
  }

  @action
  void definirMedidaExata() {
    pedidoLista.pedidos[indice].tipoDeMedida = MedidaExata();
  }

  String descritivoTipoDeMedida() {
    var tipoMedida = pedidoLista.pedidos[indice].tipoDeMedida;

    if (tipoMedida is MedidaRelativa) {
      return "Tenho as Medidas Exatas";
    }

    return "Adicionar Item";
  }

  Widget pegarTipoDeMedida() {
    var tamanho = pedidoLista.pedidos[indice].itens.length;
    var tipoDeMedida = pedidoLista.pedidos[indice].tipoDeMedida;

    if (tamanho == 0 && tipoDeMedida is MedidaExata) {
      return Container(
        width: 0,
        height: 0,
      );
    }
    return tipoDeMedida;
  }

  //contadores medida relativa
  int itemCaixaSapato() {
    return pedidoLista.pedidos[indice].caixaSapato;
  }

  @action
  void addItemCaixaSapato() {
    pedidoLista.pedidos[indice].caixaSapato++;
  }

  @action
  void rmItemCaixaSapato() {
    var qtd = pedidoLista.pedidos[indice].caixaSapato;

    if (qtd > 0) {
      pedidoLista.pedidos[indice].caixaSapato--;
    }
  }

  int itemMicroondas() {
    return pedidoLista.pedidos[indice].microondas;
  }

  @action
  void addItemMicroondas() {
    pedidoLista.pedidos[indice].microondas++;
  }

  @action
  void rmItemMicroondas() {
    var qtd = pedidoLista.pedidos[indice].microondas;

    if (qtd > 0) {
      pedidoLista.pedidos[indice].microondas--;
    }
  }

  int itemFogao() {
    return pedidoLista.pedidos[indice].fogao;
  }

  @action
  void addItemFogao() {
    pedidoLista.pedidos[indice].fogao++;
  }

  @action
  void rmItemFogao() {
    var qtd = pedidoLista.pedidos[indice].fogao;

    if (qtd > 0) {
      pedidoLista.pedidos[indice].fogao--;
    }
  }

  int itemGeladeira() {
    return pedidoLista.pedidos[indice].geladeira;
  }

  @action
  void addItemGeladeira() {
    pedidoLista.pedidos[indice].geladeira++;
  }

  @action
  void rmItemGeladeira() {
    var qtd = pedidoLista.pedidos[indice].geladeira;

    if (qtd > 0) {
      pedidoLista.pedidos[indice].geladeira--;
    }
  }

  //medida exata
  ObservableList pegarListaMedidaExata() {
    return pedidoLista.pedidos[indice].itens;
  }

  String descritivoLabel() {
    var tamanho = pedidoLista.pedidos[indice].itens.length;
    var tipoDeMedida = pedidoLista.pedidos[indice].tipoDeMedida;

    if (tamanho == 0 && tipoDeMedida is MedidaExata) {
      return 'Nenhum Item Encontrado';
    }

    return 'Quantidade de Volumes';
  }
}
