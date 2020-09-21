import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/modules/pagamento/pagamento_controller.dart';
import '../../../core/view/helpers.dart';
import '../../../core/view/tamanhos_relativos.dart';

class DadosCartao extends StatelessWidget {
  const DadosCartao({
    @required this.numeroCartaoTextController,
    @required this.validadeTextController,
    @required this.codigoSegurancaTextController,
  });

  final TextEditingController numeroCartaoTextController;
  final TextEditingController validadeTextController;
  final TextEditingController codigoSegurancaTextController;

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
                        Modular.get<PagamentoController>().pagamento.nome =
                            valor;
                      },
                      context: context,
                      placeholder: 'Nome (Mesmo Cartão)'),
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
                          .codigoSeguranca = valor;
                    },
                    context: context,
                    placeholder: 'Cód. Segurança',
                    mascara: codigoSegurancaTextController,
                    teclado: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(width: displayWidth(context) * 0.05),
              Expanded(
                child: SizedBox(
                  child: Helpers().inputCadastros(
                    onChange: (valor) {
                      Modular.get<PagamentoController>().pagamento.validade =
                          valor;
                    },
                    context: context,
                    placeholder: 'Validade',
                    mascara: validadeTextController,
                    teclado: TextInputType.number,
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
