import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';

import '../../../../../core/models/pedido.dart';
import '../../../../../core/stores/pedido_lista_store.dart';
import '../../../../../core/view/helpers.dart';

part 'endereco_controller.g.dart';

@Injectable()
class EnderecoController = _EnderecoControllerBase with _$EnderecoController;

abstract class _EnderecoControllerBase with Store {
  _EnderecoControllerBase(this.pedidoLista);

  PedidoListaStore pedidoLista;

  int indice = 0;

  @action
  void defineEnderecoOrigem(String novoEnderecoOrigem) {
    pedidoLista.pedidos[indice].enderecoOrigem = novoEnderecoOrigem;
  }

  String pegaEnderecoOrigem() {
    return pedidoLista.pedidos[indice].enderecoOrigem;
  }

  @action
  void defineEnderecoDestino(String novoEnderecoDestino) {
    pedidoLista.pedidos[indice].enderecoDestino = novoEnderecoDestino;
  }

  String pegaEnderecoDestino() {
    return pedidoLista.pedidos[indice].enderecoDestino;
  }

  Future<Null> mostraMapa({
    @required BuildContext context,
    @required TextEditingController textController,
    @required TextEditingController numeroTextController,
    @required String nome,
  }) async {
    var pedido = pedidoLista.pedidos[indice];
    _limpaEndereco(pedido, nome, textController, numeroTextController);
  }

  void _preencheEndereco(
    Pedido pedido,
    String nome,
    String address,
    TextEditingController textController,
    TextEditingController numeroTextController,
  ) {
    var endereco = Helpers.montaEndereco(address);

    textController.text = endereco;
    numeroTextController.text = address ?? null;

    if (nome == 'endereco_origem') {
      pedido.cepOrigem = address;
      pedido.enderecoOrigem = endereco;
      pedido.numeroOrigem = address ?? null;
    } else {
      pedido.cepDestino = address;
      pedido.enderecoDestino = endereco;
      pedido.numeroDestino = address ?? null;
    }
  }

  void _limpaEndereco(
    Pedido pedido,
    String nome,
    TextEditingController textController,
    TextEditingController numeroTextController,
  ) {
    textController.text = '';
    numeroTextController.text = '';

    if (nome == 'endereco_origem') {
      pedido.cepOrigem = '';
      pedido.enderecoOrigem = '';
      pedido.numeroOrigem = '';
    } else {
      pedido.cepDestino = '';
      pedido.enderecoDestino = '';
      pedido.numeroDestino = '';
    }
  }
}
