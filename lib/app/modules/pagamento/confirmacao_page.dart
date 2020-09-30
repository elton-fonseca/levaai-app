import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/tema/cores_const.dart';
import '../../core/view/botao_branco.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'pagamento_controller.dart';

class ConfirmacaoPage extends StatefulWidget {
  final String title;
  const ConfirmacaoPage({Key key, this.title = "Pagamento"}) : super(key: key);

  @override
  _ConfirmacaoPageState createState() => _ConfirmacaoPageState();
}

class _ConfirmacaoPageState
    extends ModularState<ConfirmacaoPage, PagamentoController> {
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
              controller.confirmacaoIcone(),
              size: displayWidth(context) * 0.3,
              color: Colors.white,
            )),
            Divider(
              height: displayHeight(context) * 0.1,
            ),
            Text(
              controller.confirmacaoTitulo(),
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: displayWidth(context) * 0.08,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              controller.confirmacaoTexto(),
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: displayWidth(context) * 0.05,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: displayHeight(context) * 0.1),
            controller.confirmacaoBotaoDownloadBoleto(),
            SizedBox(height: displayHeight(context) * 0.02),
            BotaoBranco(largura: 0.8, texto: 'Finalizar', onClick: () {}),
          ],
        ),
      ),
    );
  }
}
