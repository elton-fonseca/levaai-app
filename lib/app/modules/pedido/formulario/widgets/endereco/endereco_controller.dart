import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/models/pedido.dart';
import '../../../../../core/stores/pedido_lista_store.dart';
import '../../../../../core/view/helpers.dart';
import '../../repositories/formulario_repository.dart';

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

  Future<Prediction> _mapaControlador(BuildContext context) async {
    return await PlacesAutocomplete.show(
      context: context,
      apiKey: "AIzaSyCZ4POmTNuwNXDnnAypsMmg_WGpSNMNxos",
      mode: Mode.overlay, // Mode.fullscreen
      language: "pt_br",
      components: [Component(Component.country, "br")],
    );
  }

  Future<Null> mostraMapa({
    @required BuildContext context,
    @required TextEditingController textController,
    @required String nome,
  }) async {
    var pedido = pedidoLista.pedidos[indice];
    _limpaEndereco(pedido, nome, textController);

    var p = await _mapaControlador(context);

    if (p != null) {
      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      if (address[0].postalCode == null) {
        Helpers.snackLevaai(texto: "Endereço Invalido", context: context);
        return;
      }

      if (address[0].subThoroughfare == null) {
        Helpers.snackLevaai(
            texto: "O número deve ser informado no endereço", context: context);
        return;
      }

      _preencheEndereco(pedido, nome, address[0], textController);

      _verificaCidadesPercurso(context);
    }
  }

  void _preencheEndereco(
    Pedido pedido,
    String nome,
    Address address,
    TextEditingController textController,
  ) {
    textController.text = address.addressLine;

    if (nome == 'endereco_origem') {
      pedido.cepOrigem = address.postalCode;
      pedido.enderecoOrigem = address.addressLine;
    } else {
      pedido.cepDestino = address.postalCode;
      pedido.enderecoDestino = address.addressLine;
    }
  }

  void _limpaEndereco(
    Pedido pedido,
    String nome,
    TextEditingController textController,
  ) {
    textController.text = '';

    if (nome == 'endereco_origem') {
      pedido.cepOrigem = '';
      pedido.enderecoOrigem = '';
    } else {
      pedido.cepDestino = '';
      pedido.enderecoDestino = '';
    }
  }

  void _verificaCidadesPercurso(BuildContext context) {
    var pedido = pedidoLista.pedidos[indice];

    if (pedido.enderecoOrigem != null &&
        pedido.enderecoOrigem != '' &&
        pedido.enderecoDestino != null &&
        pedido.enderecoDestino != '') {
      if (pedido.enderecoOrigem == pedido.enderecoDestino) {
        Helpers.snackLevaai(
            texto: "Os endereços não podem ser iguais", context: context);
      }

      var json = jsonEncode(pedido.cidadesJson());

      Modular.get<FormularioRepository>()
          .verificaCidadesAtendidas(json)
          .then((value) => pedido.cidadesAtendidas = true)
          .catchError((e) {
        Helpers.snackLevaai(texto: "Percurso não atendido", context: context);
        pedido.cidadesAtendidas = false;
      });
    }
  }
}
