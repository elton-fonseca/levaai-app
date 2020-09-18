import 'package:flutter/cupertino.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
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
    var p = await _mapaControlador(context);
    if (p != null) {
      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      textController.text = address[0].addressLine;
      if (nome == 'endereco_origem') {
        Modular.get<PedidoListaStore>().pedidos[indice].cepOrigem =
            address[0].postalCode;
        Modular.get<PedidoListaStore>().pedidos[indice].enderecoOrigem =
            address[0].addressLine;
      } else {
        Modular.get<PedidoListaStore>().pedidos[indice].cepDestino =
            address[0].postalCode;
        Modular.get<PedidoListaStore>().pedidos[indice].enderecoDestino =
            address[0].addressLine;
      }
    }
  }
}
