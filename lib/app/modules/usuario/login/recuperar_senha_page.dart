import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/tema/cores_const.dart';
import '../../../core/view/botao_branco.dart';
import '../../../core/view/tamanhos_relativos.dart';
import 'resetar_senha_page.dart';
import 'widgets/inputs.dart';

class RecuperarSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context) * 1,
        width: displayWidth(context) * 1,
        color: CoresConst.azulPadrao,
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
              "Esqueceu a sua senha?",
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
                        child: Observer(
                      builder: (context) => Input().texto(
                        context: context,
                        placeholder: 'Número do seu Celular',
                        validador: null,
                        onChange: null,
                      ),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(height: displayHeight(context) * 0.1),
            BotaoBranco(
                largura: 0.8,
                texto: 'Enviar',
                onClick: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ResetarSenha()
                      ));;
                    }),
          ],
        ),
      ),
    );
  }
}