import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/tema/cores_const.dart';
import '../../../../core/view/botao_branco.dart';
import '../../../../core/view/tamanhos_relativos.dart';
import '../widgets/inputs.dart';
import 'alterar_senha_controller.dart';
import 'gerar_token_controller.dart';

class TrocarSenhaTokenPage extends StatefulWidget {
  @override
  _TrocarSenhaTokenPageState createState() => _TrocarSenhaTokenPageState();
}

class _TrocarSenhaTokenPageState extends State<TrocarSenhaTokenPage> {
  MaskedTextController maskedTextController = MaskedTextController(
    mask: '(00) 00000-0000',
  );

  @override
  void initState() {
    Modular.get<GerarTokenController>().limpar();
    Modular.get<AlterarSenhaController>().limpar();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (contextScaffold) => SingleChildScrollView(
          child: Container(
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
                    Icons.enhanced_encryption,
                    size: displayWidth(context) * 0.3,
                    color: Colors.white,
                  )),
                  Divider(
                    height: displayHeight(context) * 0.1,
                  ),
                  Text(
                    "Precisa trocar a senha?",
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
                    "Digite o número de seu celular cadastrado.\n" +
                        "Vamos enviar um código de confirmação por SMS.",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: displayWidth(context) * 0.04,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: displayHeight(context) * 0.1),
                  Container(
                    width: displayWidth(context) * 0.7,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            child: Input().texto(
                                context: context,
                                placeholder: 'Número do seu Celular',
                                onChange: (v) =>
                                    Modular.get<GerarTokenController>().telefone =
                                        v,
                                textController: maskedTextController,
                                teclado: 'numero'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: displayHeight(context) * 0.1),
                  BotaoBranco(
                    largura: 0.8,
                    texto: 'Enviar',
                    onClick: () => Modular.get<GerarTokenController>()
                        .obterToken(contextScaffold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
