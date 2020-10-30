import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/modules/usuario/login/troca-senha/alterar_senha_controller.dart';
import '../../../../core/tema/cores_const.dart';
import '../../../../core/view/botao_branco.dart';
import '../../../../core/view/tamanhos_relativos.dart';
import '../widgets/inputs.dart';

class TrocarSenhaFormPage extends StatefulWidget {
  @override
  _TrocarSenhaFormPageState createState() => _TrocarSenhaFormPageState();
}

class _TrocarSenhaFormPageState extends State<TrocarSenhaFormPage> {
  MaskedTextController tokenTextController = MaskedTextController(
    mask: '0000',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (contextScaffold) => Container(
          height: displayHeight(context) * 1,
          width: displayWidth(context) * 1,
          color: CoresConst.azulPadrao,
          child: Padding(
            padding: EdgeInsets.all(displayWidth(context) * 0.025),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    child: Icon(
                  Icons.vpn_key,
                  size: displayWidth(context) * 0.3,
                  color: Colors.white,
                )),
                Divider(
                  height: displayHeight(context) * 0.07,
                ),
                Text(
                  "Resetar Senha",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: displayWidth(context) * 0.08,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  height: displayHeight(context) * 0.02,
                ),
                Text(
                  "Digite o número de confirmação que você recebeu\n " +
                      "por SMS e uma nova senha com 8 digitos.",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: displayWidth(context) * 0.04,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: displayHeight(context) * 0.07),
                Container(
                  width: displayWidth(context) * 0.7,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: SizedBox(
                            child: Input().texto(
                              context: context,
                              placeholder: 'Código de confirmação',
                              onChange: (v) =>
                                  Modular.get<AlterarSenhaController>()
                                      .tokenDigitado = v,
                              textController: tokenTextController,
                              teclado: 'numerico',
                              tamanho: 4,
                            ),
                          )),
                        ],
                      ),
                      Divider(
                        height: displayHeight(context) * 0.01,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: SizedBox(
                            child: Input().texto(
                              context: context,
                              placeholder: 'Nova Senha',
                              senha: true,
                              onChange: (v) =>
                                  Modular.get<AlterarSenhaController>().senha =
                                      v,
                            ),
                          )),
                        ],
                      ),
                      Divider(
                        height: displayHeight(context) * 0.01,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: SizedBox(
                            child: Input().texto(
                              context: context,
                              placeholder: 'Confirmar Nova Senha',
                              senha: true,
                              onChange: (v) =>
                                  Modular.get<AlterarSenhaController>()
                                      .senhaConfirmacao = v,
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.07),
                BotaoBranco(
                    largura: 0.8,
                    texto: 'Concluir',
                    onClick: () {
                      Modular.get<AlterarSenhaController>()
                          .alterarSenha(contextScaffold);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
