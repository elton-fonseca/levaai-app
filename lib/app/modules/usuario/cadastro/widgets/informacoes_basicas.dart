import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/tema/cores_const.dart';
import '../../../../core/view/helpers.dart';
import '../../../../core/view/tamanhos_relativos.dart';
import '../cadastro_controller.dart';
import 'tipo_pessoa_dropdown.dart';

class InformacoesBasicas extends StatelessWidget {
  const InformacoesBasicas(
      {this.documentoTextController, this.telefoneTextController});

  final TextEditingController documentoTextController;
  final TextEditingController telefoneTextController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(const Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(
            color: CoresConst.azulPadrao.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 15,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: displayHeight(context) * 0.02),
          Text(
            'Dados de cadastro:',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: displayWidth(context) * 0.04,
            ),
            textAlign: TextAlign.center,
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
                    child: Observer(builder: (_) {
                      return TipoPessoaDropdown(
                        documentoTextController: documentoTextController,
                      );
                    }),
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
                    child: Observer(builder: (_) {
                      return Helpers().inputCadastros(
                        onChange: (valor) {
                          Modular.get<CadastroController>()
                              .usuario
                              .nomeFantasia = valor;
                        },
                        context: context,
                        placeholder: Modular.get<CadastroController>().pj()
                            ? 'Nome Fantasia'
                            : 'Nome',
                        tamanho: 100,
                      );
                    }),
                  ),
                ),
                SizedBox(width: displayWidth(context) * 0.05),
                Expanded(
                  child: SizedBox(
                    child: Observer(builder: (_) {
                      return Helpers().inputCadastros(
                        onChange: (valor) {
                          Modular.get<CadastroController>()
                              .usuario
                              .sobrenomeRazao = valor;
                        },
                        context: context,
                        placeholder: Modular.get<CadastroController>().pj()
                            ? 'Razão Social'
                            : 'Sobrenome',
                        tamanho: 100,
                      );
                    }),
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
                      mascara: telefoneTextController,
                      onChange: (valor) {
                        //no init da pagina
                      },
                      context: context,
                      placeholder: 'Telefone',
                      teclado: TextInputType.number,
                      tamanho: 15,
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
                    child: Observer(builder: (_) {
                      return Helpers().inputCadastros(
                        mascara: documentoTextController,
                        teclado: TextInputType.number,
                        onChange: (valor) {
                          //no init da pagina
                        },
                        context: context,
                        placeholder: Modular.get<CadastroController>().pj()
                            ? 'CNPJ'
                            : 'CPF',
                        tamanho: 18,
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: displayWidth(context) * 0.08),
        ],
      ),
    );
  }
}
