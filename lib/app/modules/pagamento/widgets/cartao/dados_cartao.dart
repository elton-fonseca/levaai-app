import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/view/helpers.dart';
import '../../../../core/view/tamanhos_relativos.dart';
import '../../pagamento_controller.dart';

class DadosCartao extends StatelessWidget {
  const DadosCartao({
    @required this.numeroCartaoTextController,
    @required this.validadeTextController,
    @required this.codigoSegurancaTextController,
    @required this.enderecoFaturamentoCepTextController,
    @required this.enderecoFaturamentoLogradouroTextController,
    @required this.enderecoFaturamentoNumeroTextController,
    @required this.enderecoFaturamentoBairroTextController,
    @required this.enderecoFaturamentoCidadeTextController,
    @required this.enderecoFaturamentoEstadoTextController,
  });

  final TextEditingController numeroCartaoTextController;
  final TextEditingController validadeTextController;
  final TextEditingController codigoSegurancaTextController;
  final TextEditingController enderecoFaturamentoCepTextController;
  final TextEditingController enderecoFaturamentoLogradouroTextController;
  final TextEditingController enderecoFaturamentoNumeroTextController;
  final TextEditingController enderecoFaturamentoBairroTextController;
  final TextEditingController enderecoFaturamentoCidadeTextController;
  final TextEditingController enderecoFaturamentoEstadoTextController;

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
                      tamanho: 5),
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
                      Modular.get<PagamentoController>()
                          .pagamento
                          .cepFaturamento = valor;
                      Modular.get<PagamentoController>().autocompleteEndereco(
                        context: context,
                        cep: valor,
                        logradouroTextController:
                            enderecoFaturamentoLogradouroTextController,
                        bairroTextController:
                            enderecoFaturamentoBairroTextController,
                        cidadeTextController:
                            enderecoFaturamentoCidadeTextController,
                        estadoTextController:
                            enderecoFaturamentoEstadoTextController,
                      );
                    },
                    context: context,
                    placeholder: 'CEP',
                    mascara: enderecoFaturamentoCepTextController,
                    teclado: TextInputType.number,
                    tamanho: 10,
                  ),
                ),
              ),
              SizedBox(width: displayWidth(context) * 0.05),
              Expanded(
                child: SizedBox(
                  child: Helpers().inputCadastros(
                      onChange: (valor) {
                        Modular.get<PagamentoController>()
                            .pagamento
                            .logradouroFaturamento = valor;
                      },
                      context: context,
                      placeholder: 'Logradouro',
                      mascara: enderecoFaturamentoLogradouroTextController,
                      teclado: TextInputType.number,
                      tamanho: 9),
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
                      Modular.get<PagamentoController>()
                          .pagamento
                          .numeroFaturamento = valor;
                    },
                    context: context,
                    placeholder: 'Número',
                    mascara: enderecoFaturamentoNumeroTextController,
                    teclado: TextInputType.number,
                    tamanho: 10,
                  ),
                ),
              ),
              SizedBox(width: displayWidth(context) * 0.05),
              Expanded(
                child: SizedBox(
                  child: Helpers().inputCadastros(
                    onChange: (valor) {
                      Modular.get<PagamentoController>()
                          .pagamento
                          .bairroFaturamento = valor;
                    },
                    context: context,
                    placeholder: 'Bairro',
                    mascara: enderecoFaturamentoBairroTextController,
                    teclado: TextInputType.number,
                    tamanho: 9,
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
                      Modular.get<PagamentoController>()
                          .pagamento
                          .cidadeFaturamento = valor;
                    },
                    context: context,
                    placeholder: 'Cidade - Estado',
                    mascara: enderecoFaturamentoCidadeTextController,
                    teclado: TextInputType.number,
                    tamanho: 10,
                  ),
                ),
              ),
              SizedBox(width: displayWidth(context) * 0.05),
              Expanded(
                child: SizedBox(
                  child: Helpers().inputCadastros(
                    onChange: (valor) {
                      Modular.get<PagamentoController>()
                          .pagamento
                          .estadoFaturamento = valor;
                    },
                    context: context,
                    placeholder: 'Estado',
                    mascara: enderecoFaturamentoEstadoTextController,
                    teclado: TextInputType.number,
                    tamanho: 10,
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
