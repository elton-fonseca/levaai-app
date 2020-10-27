import 'package:flutter/material.dart';

import '../../../../core/view/tamanhos_relativos.dart';
import '../recuperar_senha_page.dart';

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
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RecuperarSenha()));
              },
              child: Text(
                'Clique aqui',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: displayWidth(context) * 0.03,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
