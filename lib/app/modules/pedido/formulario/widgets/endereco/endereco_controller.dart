import 'package:Levaai/app/core/view/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/stores/pedido_lista_store.dart';
import '../../repositories/formulario_repository.dart';

part 'endereco_controller.g.dart';

@Injectable()
class EnderecoController = _EnderecoControllerBase with _$EnderecoController;

abstract class _EnderecoControllerBase with Store {
  _EnderecoControllerBase(this.pedidoLista);

  PedidoListaStore pedidoLista;

  int indice = 0;

  @observable
  bool readOnly = true;

  @action
  void liberaReadOnly() {
    readOnly = false;
  }

  void preencheCamposEndereco({
    @required TextEditingController cepOrigemTextController,
    @required TextEditingController logradouroOrigemTextController,
    @required TextEditingController numeroOrigemTextController,
    @required TextEditingController bairroOrigemTextController,
    @required TextEditingController cepDestinoTextController,
    @required TextEditingController logradouroDestinoTextController,
    @required TextEditingController numeroDestinoTextController,
    @required TextEditingController bairroDestinoTextController,
  }) {
    cepOrigemTextController.value = pedidoLista.pedidos[indice].cepOrigem;
    logradouroOrigemTextController.value =
        pedidoLista.pedidos[indice].logradouroOrigem;
    numeroOrigemTextController.value = pedidoLista.pedidos[indice].numeroOrigem;
    bairroOrigemTextController.value = pedidoLista.pedidos[indice].bairroOrigem;

    cepDestinoTextController.value = pedidoLista.pedidos[indice].cepDestino;
    logradouroDestinoTextController.value =
        pedidoLista.pedidos[indice].logradouroDestino;
    numeroDestinoTextController.value =
        pedidoLista.pedidos[indice].numeroDestino;
    bairroDestinoTextController.value =
        pedidoLista.pedidos[indice].bairroDestino;
  }

  @action
  void autocompleteEndereco({
    BuildContext context,
    String cep,
    @required TextEditingController logradouroTextController,
    @required TextEditingController bairroTextController,
    @required String tipo,
  }) {
    if (cep.length == 9) {
      Modular.get<FormularioRepository>()
          .enderecoCep(cep, verificaAtendimento: true)
          .then((endereco) {
        logradouroTextController.text = endereco['endereco'];
        bairroTextController.text = endereco['bairro'];
        defineLogradouro(endereco['endereco'], tipo);
        defineBairro(endereco['bairro'], tipo);
        defineCep(cep, tipo);
        defineCidade(endereco['ibge'], tipo);
      }).catchError((erro) {
        Helpers.alerta(
          titulo: "Atenção",
          descricao: "${erro.response.data['cep']}",
          context: context,
        );
      });
    }
  }

  void defineCep(String cep, String tipo) {
    if (tipo == 'origem') {
      pedidoLista.pedidos[indice].cepOrigem = cep;
    } else {
      pedidoLista.pedidos[indice].cepDestino = cep;
    }
  }

  void defineLogradouro(String logradouro, String tipo) {
    if (tipo == 'origem') {
      pedidoLista.pedidos[indice].logradouroOrigem = logradouro;
    } else {
      pedidoLista.pedidos[indice].logradouroDestino = logradouro;
    }
  }

  void defineNumero(String numero, String tipo) {
    if (tipo == 'origem') {
      pedidoLista.pedidos[indice].numeroOrigem = numero;
    } else {
      pedidoLista.pedidos[indice].numeroDestino = numero;
    }
  }

  void defineBairro(String bairro, String tipo) {
    if (tipo == 'origem') {
      pedidoLista.pedidos[indice].bairroOrigem = bairro;
    } else {
      pedidoLista.pedidos[indice].bairroDestino = bairro;
    }
  }

  String pegaCidade(String tipo) {
    if (tipo == 'origem') {
      return pedidoLista.pedidos[indice].ibgeOrigem;
    } else {
      return pedidoLista.pedidos[indice].ibgeDestino;
    }
  }

  @action
  void defineCidade(String cidade, String tipo) {
    if (tipo == 'origem') {
      pedidoLista.pedidos[indice].ibgeOrigem = cidade;
    } else {
      pedidoLista.pedidos[indice].ibgeDestino = cidade;
    }
  }
}
