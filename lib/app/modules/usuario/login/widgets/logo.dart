import 'package:flutter/material.dart';
import '../../../../core/view/tamanhos_relativos.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: displayHeight(context) * 0.1),
          child: Text(
            'Acesse sua conta',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontSize: displayHeight(context) * 0.027,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: displayHeight(context) * 0.05),
          child: Center(
            child: SizedBox(
              width: displayHeight(context) * 0.19,
              child: Image.asset("assets/imagens/logo.png"),
            ),
          ),
        ),
      ],
    );
  }
}
