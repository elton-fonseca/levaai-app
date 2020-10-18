import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/models/pagamento.dart';
import '../../../../core/view/helpers.dart';
import '../../pagamento_controller.dart';

part 'dados_cartao_controller.g.dart';

class DadosCartaoController = _DadosCartaoControllerBase
    with _$DadosCartaoController;

abstract class _DadosCartaoControllerBase with Store {
  @action
  void defineEnderecoFaturamento(String novoEnderecoDestino) {
    //pedidoLista.pedidos[indice].enderecoDestino = novoEnderecoDestino;
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
    var pagamento = Modular.get<PagamentoController>().pagamento;
    _limpaCampos(pagamento, textController);

    var p = await _mapaControlador(context);

    if (p != null) {
      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      if (address[0].postalCode == null || address[0].subThoroughfare == null) {
        Helpers.snackLevaai(texto: "Endereço Invalido", context: context);
        return;
      }

      _preencheCampos(pagamento, address[0], textController);
    }
  }

  void _preencheCampos(
    Pagamento pagamento,
    Address address,
    TextEditingController textController,
  ) {
    textController.text = address.addressLine;

    pagamento.cepFaturamento = address.postalCode;
    pagamento.logradouroFaturamento = address.thoroughfare;
    pagamento.numeroFaturamento = address.subThoroughfare;
    pagamento.cidadeFaturamento = address.subAdminArea;
    pagamento.estadoFaturamento = Helpers.pegarSiglaEstado(address.adminArea);
    pagamento.cidadeFaturamento = address.subAdminArea;
  }

  void _limpaCampos(
    Pagamento pagamento,
    TextEditingController textController,
  ) {
    textController.text = '';

    pagamento.cepFaturamento = '';
    pagamento.logradouroFaturamento = '';
    pagamento.numeroFaturamento = '';
    pagamento.cidadeFaturamento = '';
    pagamento.estadoFaturamento = '';
  }
}
