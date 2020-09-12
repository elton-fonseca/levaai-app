import 'package:flutter/material.dart';
import '../../../core/view/tamanhos_relativos.dart';

class Rodape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Esqueceu a senha? ",
              style: TextStyle(
                color: Colors.white,
                fontSize: displayWidth(context) * 0.031,
              ),
            ),
            Text(
              "Clique Aqui.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: displayWidth(context) * 0.031,
              ),
            ),
          ],
        ),
        SizedBox(height: displayHeight(context) * 0.12),
        Text(
          "2020 LevaAi - Todos os direitos reservados",
          style: TextStyle(
            color: Colors.white,
            fontSize: displayWidth(context) * 0.025,
          ),
        )
      ],
    );
  }
}
