import 'package:flutter/material.dart';
import '../../../core/tema/cores_const.dart';
import '../../../core/view/botao_branco.dart';
import '../../../core/view/tamanhos_relativos.dart';


class PosPagamentoPage extends StatelessWidget {
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
              Icons.check_circle_outline,
              size: displayWidth(context) * 0.3,
              color: Colors.white,
            )),
            Divider(
              height: displayHeight(context) * 0.1,
            ),
            Text(
              'Seu pagamento foi efetuado com sucesso!',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: displayWidth(context) * 0.08,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Seu ID de confirmação é 258998855525',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: displayWidth(context) * 0.05,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: displayHeight(context) * 0.1
              ),
            BotaoBranco(
              largura: 0.8,
              texto: 'Botão 1',
              onClick: () {}
              ),
            SizedBox(
              height: displayHeight(context) * 0.02
              ),
            BotaoBranco(largura: 0.8,
            texto: 'Botão 2',
            onClick: () {}
            ),
          ],
        ),
      ),
    );
  }
}
