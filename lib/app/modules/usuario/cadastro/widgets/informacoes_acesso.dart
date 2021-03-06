import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/tema/cores_const.dart';
import '../../../../core/view/helpers.dart';
import '../../../../core/view/tamanhos_relativos.dart';
import '../cadastro_controller.dart';

class InformacoesAcesso extends StatelessWidget {
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
            'Informações de acesso:',
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
                    child: Helpers().inputCadastros(
                      teclado: TextInputType.emailAddress,
                      onChange: (valor) {
                        Modular.get<CadastroController>().usuario.email = valor;
                      },
                      context: context,
                      placeholder: 'Email',
                      tamanho: 100,
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
                        Modular.get<CadastroController>().usuario.senha = valor;
                      },
                      senha: true,
                      context: context,
                      placeholder: 'Senha',
                      tamanho: 30,
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
                        Modular.get<CadastroController>()
                            .usuario
                            .confirmacaoSenha = valor;
                      },
                      senha: true,
                      context: context,
                      placeholder: 'Confirmar senha',
                      tamanho: 30,
                    ),
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
