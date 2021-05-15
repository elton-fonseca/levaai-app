import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

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
    @required TextEditingController complementoOrigemTextController,
    @required TextEditingController bairroOrigemTextController,
    @required TextEditingController cepDestinoTextController,
    @required TextEditingController logradouroDestinoTextController,
    @required TextEditingController numeroDestinoTextController,
    @required TextEditingController complementoDestinoTextController,
    @required TextEditingController bairroDestinoTextController,
  }) {
    cepOrigemTextController.text = pedidoLista.pedidos[indice].cepOrigem;
    logradouroOrigemTextController.text =
        pedidoLista.pedidos[indice].logradouroOrigem;
    numeroOrigemTextController.text = pedidoLista.pedidos[indice].numeroOrigem;
    complementoOrigemTextController.text =
        pedidoLista.pedidos[indice].complementoOrigem;
    bairroOrigemTextController.text = pedidoLista.pedidos[indice].bairroOrigem;

    cepDestinoTextController.text = pedidoLista.pedidos[indice].cepDestino;
    logradouroDestinoTextController.text =
        pedidoLista.pedidos[indice].logradouroDestino;
    numeroDestinoTextController.text =
        pedidoLista.pedidos[indice].numeroDestino;
    complementoDestinoTextController.text =
        pedidoLista.pedidos[indice].complementoDestino;
    bairroDestinoTextController.text =
        pedidoLista.pedidos[indice].bairroDestino;
  }

  @action
  void autocompleteEndereco(
      {BuildContext context,
      String cep,
      @required TextEditingController logradouroTextController,
      @required TextEditingController numeroTextController,
      @required TextEditingController bairroTextController,
      @required String tipo,
      @required Function atualizaCidadeDropdown}) {
    if (cep.length == 9) {
      numeroTextController.text = '';
      Modular.get<FormularioRepository>()
          .enderecoCep(cep, verificaAtendimento: true)
          .then((endereco) {
        logradouroTextController.text = endereco['endereco'];
        bairroTextController.text = endereco['bairro'];
        defineLogradouro(endereco['endereco'], tipo);
        defineBairro(endereco['bairro'], tipo);
        defineCep(cep, tipo);

        defineCidadeIbge(endereco['ibge'], tipo);
        defineCidadeNome(endereco['cidade'], tipo);
        atualizaCidadeDropdown(endereco['ibge']);
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

  void defineComplemento(String complemento, String tipo) {
    if (tipo == 'origem') {
      pedidoLista.pedidos[indice].complementoOrigem = complemento;
    } else {
      pedidoLista.pedidos[indice].complementoDestino = complemento;
    }
  }

  void defineBairro(String bairro, String tipo) {
    if (tipo == 'origem') {
      pedidoLista.pedidos[indice].bairroOrigem = bairro;
    } else {
      pedidoLista.pedidos[indice].bairroDestino = bairro;
    }
  }

  void defineCidadeIbge(String ibge, String tipo) {
    if (tipo == 'origem') {
      pedidoLista.pedidos[indice].ibgeOrigem = ibge;
    } else {
      pedidoLista.pedidos[indice].ibgeDestino = ibge;
    }
  }

  String obtemCidadeIbge(String tipo) {
    if (tipo == 'origem') {
      return pedidoLista.pedidos[indice].ibgeOrigem;
    } else {
      return pedidoLista.pedidos[indice].ibgeDestino;
    }
  }

  void defineCidadeNome(String cidadeNome, String tipo) {
    if (tipo == 'origem') {
      pedidoLista.pedidos[indice].cidadeOrigem = cidadeNome;
    } else {
      pedidoLista.pedidos[indice].cidadeDestino = cidadeNome;
    }
  }
}
