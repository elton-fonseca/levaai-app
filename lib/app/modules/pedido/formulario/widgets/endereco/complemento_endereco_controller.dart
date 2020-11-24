import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/stores/pedido_lista_store.dart';
import '../../../../../core/view/tamanhos_relativos.dart';

part 'complemento_endereco_controller.g.dart';

@Injectable()
class ComplementoEnderecoController = _ComplementoEnderecoControllerBase
    with _$ComplementoEnderecoController;

abstract class _ComplementoEnderecoControllerBase with Store {
  _ComplementoEnderecoControllerBase(this.pedidoLista);

  PedidoListaStore pedidoLista;

  int indice = 0;

  @action
  void _defineSeTemComplementoEnderecoOrigem({bool status}) {
    pedidoLista.pedidos[indice].temComplementoOrigem = status;
  }

  void _defineComplementoEnderecoOrigem(String novoComplementoEnderecoOrigem) {
    pedidoLista.pedidos[indice].complementoOrigem =
        novoComplementoEnderecoOrigem;
  }

  String pegaComplementoEnderecoOrigem() {
    return pedidoLista.pedidos[indice].complementoOrigem;
  }

  Widget complementoEnderecoOrigem(
      BuildContext context, TextEditingController textController) {
    if (pedidoLista.pedidos[indice].temComplementoOrigem == false) {
      return _labelComplementoEndereco(context, 'origem');
    } else {
      return _inputComplementoEndereco(
        context: context,
        textController: textController,
        tipo: 'origem',
      );
    }
  }

  @action
  void _defineSeTemComplementoEnderecoDestino({bool status}) {
    pedidoLista.pedidos[indice].temComplementoDestino = status;
  }

  @action
  void _defineComplementoEnderecoDestino(
      String novoComplementoEnderecoDestino) {
    pedidoLista.pedidos[indice].complementoDestino =
        novoComplementoEnderecoDestino;
  }

  String pegaComplementoEnderecoDestino() {
    return pedidoLista.pedidos[indice].complementoDestino;
  }

  Widget complementoEnderecoDestino(
      BuildContext context, TextEditingController textController) {
    if (pedidoLista.pedidos[indice].temComplementoDestino == false) {
      return _labelComplementoEndereco(context, 'destino');
    } else {
      return _inputComplementoEndereco(
        context: context,
        textController: textController,
        tipo: 'destino',
      );
    }
  }

  Widget _labelComplementoEndereco(BuildContext context, String tipo) {
    return SizedBox(
      width: displayWidth(context) * 0.85,
      height: displayHeight(context) * 0.02,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.redAccent,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Cliqui aqui para preencher complemento',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (tipo == 'origem') {
                    _defineSeTemComplementoEnderecoOrigem(status: true);
                  } else {
                    _defineSeTemComplementoEnderecoDestino(status: true);
                  }
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputComplementoEndereco({
    BuildContext context,
    TextEditingController textController,
    String tipo,
  }) {
    return SizedBox(
      width: displayWidth(context) * 0.85,
      height: displayHeight(context) * 0.1,
      child: TextFormField(
        controller: textController,
        onChanged: (value) {
          if (tipo == 'origem') {
            _defineComplementoEnderecoOrigem(value);
          } else {
            _defineComplementoEnderecoDestino(value);
          }
        },
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.grey[600],
          fontSize: displayWidth(context) * 0.032,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: displayWidth(context) * 0.035,
            fontWeight: FontWeight.bold,
          ),
          labelText: 'Complemento Endereço de $tipo',
          hintText: 'Digite o complemento ou referência',
          suffixIcon: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              if (tipo == 'origem') {
                _defineSeTemComplementoEnderecoOrigem(status: false);
              } else {
                _defineSeTemComplementoEnderecoDestino(status: false);
              }
            },
          ),
        ),
      ),
    );
  }
}
