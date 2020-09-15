import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/view/botao_azul.dart';

class Rodape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BotaoAzul(
          texto: 'Ir para pagamento',
          onClick: () {
            Modular.to.pushNamed('/usuario/cadastro');
          },
        ),
      ],
    );
  }
}
