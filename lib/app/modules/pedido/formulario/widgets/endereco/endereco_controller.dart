import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';

import 'package:mobx/mobx.dart';

import '../../../../../core/models/pedido.dart';
import '../../../../../core/repositories/monitoramento_repository.dart';
import '../../../../../core/stores/pedido_lista_store.dart';
import '../../../../../core/view/botao_azul.dart';
import '../../../../../core/view/helpers.dart';
import '../../../../../core/view/tamanhos_relativos.dart';
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
    @required TextEditingController numeroTextController,
    @required String nome,
  }) async {
    var pedido = pedidoLista.pedidos[indice];
    _limpaEndereco(pedido, nome, textController, numeroTextController);

    var p = await _mapaControlador(context);

    if (p != null) {
      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      if (address[0].thoroughfare == null) {
        Helpers.snackLevaai(texto: "Endereço Invalido", context: context);
        return;
      }

      _preencheEndereco(
        pedido,
        nome,
        address[0],
        textController,
        numeroTextController,
      );

      if (address[0].postalCode == null) {
        _perguntaCep(context, nome);
      } else {
        _verificaCidadesPercurso(context);
      }
    }
  }

  void _preencheEndereco(
    Pedido pedido,
    String nome,
    Address address,
    TextEditingController textController,
    TextEditingController numeroTextController,
  ) {
    var endereco = Helpers.montaEndereco(address);

    textController.text = endereco;
    numeroTextController.text = address.subThoroughfare ?? null;

    if (nome == 'endereco_origem') {
      pedido.cepOrigem = address.postalCode;
      pedido.enderecoOrigem = endereco;
      pedido.numeroOrigem = address.subThoroughfare ?? null;
    } else {
      pedido.cepDestino = address.postalCode;
      pedido.enderecoDestino = endereco;
      pedido.numeroDestino = address.subThoroughfare ?? null;
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

  Future<Widget> _perguntaCep(BuildContext context, String nome) async {
    return showDialog(
        useSafeArea: true,
        child: Dialog(
          child: Container(
            height: displayHeight(context) * 0.35,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 10),
                  child: Text('Entre com o CEP'),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: MaskedTextController(mask: '00000-000'),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9),
                    ],
                    onChanged: (value) {
                      if (nome == 'endereco_origem') {
                        pedidoLista.pedidos[indice].cepOrigem = value;
                      } else {
                        pedidoLista.pedidos[indice].cepDestino = value;
                      }
                    },
                    decoration: InputDecoration(hintText: "Digite o cep"),
                    //controller: _c,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BotaoAzul(
                    texto: 'Definir',
                    onClick: () {
                      _verificaCidadesPercurso(context);
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        context: context);
  }

  void _verificaCidadesPercurso(BuildContext context) {
    var pedido = pedidoLista.pedidos[indice];

    if (pedido.enderecoOrigem != null &&
        pedido.enderecoOrigem != '' &&
        pedido.enderecoDestino != null &&
        pedido.enderecoDestino != '') {
      var json = jsonEncode(pedido.cidadesJson());

      Modular.get<FormularioRepository>()
          .verificaCidadesAtendidas(json)
          .then((value) => pedido.cidadesAtendidas = true)
          .catchError((e) {
        Modular.get<MonitoramentoRepository>()
            .registrarAcao('endereco_nao_atendido');
        Helpers.snackLevaai(texto: "Percurso não atendido", context: context);
        pedido.cidadesAtendidas = false;
      });
    }
  }
}
