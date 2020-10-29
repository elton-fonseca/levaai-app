import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/view/helpers.dart';
import '../../../../core/view/tamanhos_relativos.dart';
import '../../pagamento_controller.dart';
import 'dados_cartao_controller.dart';

class DadosCartao extends StatelessWidget {
  const DadosCartao({
    @required this.numeroCartaoTextController,
    @required this.validadeTextController,
    @required this.codigoSegurancaTextController,
    @required this.enderecoFaturamentoTextController,
  });

  final TextEditingController numeroCartaoTextController;
  final TextEditingController validadeTextController;
  final TextEditingController codigoSegurancaTextController;
  final TextEditingController enderecoFaturamentoTextController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.03,
            left: displayWidth(context) * 0.025,
            right: displayWidth(context) * 0.025,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  child: Helpers().inputCadastros(
                      onChange: (valor) {
                        Modular.get<PagamentoController>()
                            .pagamento
                            .numeroCartao = valor;
                      },
                      context: context,
                      placeholder: 'Número Cartão',
                      mascara: numeroCartaoTextController,
                      teclado: TextInputType.number,
                      tamanho: 19),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.03,
            left: displayWidth(context) * 0.025,
            right: displayWidth(context) * 0.025,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  child: Helpers().inputCadastros(
                    onChange: (valor) {
                      Modular.get<PagamentoController>().pagamento.nome = valor;
                    },
                    context: context,
                    placeholder: 'Nome (Mesmo Cartão)',
                    tamanho: 45,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.03,
            left: displayWidth(context) * 0.025,
            right: displayWidth(context) * 0.025,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  child: Helpers().inputCadastros(
                    onChange: (valor) {
                      //no init da página
                    },
                    context: context,
                    placeholder: 'Cód. Segurança',
                    mascara: codigoSegurancaTextController,
                    teclado: TextInputType.number,
                    tamanho: 4,
                  ),
                ),
              ),
              SizedBox(width: displayWidth(context) * 0.05),
              Expanded(
                child: SizedBox(
                  child: Helpers().inputCadastros(
                    onChange: (valor) {
                      //no init da página
                    },
                    context: context,
                    placeholder: 'Validade',
                    mascara: validadeTextController,
                    teclado: TextInputType.number,
                    tamanho: 5
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.03,
            left: displayWidth(context) * 0.025,
            right: displayWidth(context) * 0.025,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  child: TextFormField(
                    controller: enderecoFaturamentoTextController,
                    onChanged: (valor) => Modular.get<DadosCartaoController>()
                        .defineEnderecoFaturamento(valor),
                    onTap: () {
                      Modular.get<DadosCartaoController>().mostraMapa(
                          context: context,
                          textController: enderecoFaturamentoTextController,
                          nome: 'endereco_origem');
                    },
                    readOnly: true,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: displayWidth(context) * 0.04,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: BorderSide(
                          color: Colors.grey[700],
                          width: 4,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Endereço Faturamento',
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[400],
                        fontSize: displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
