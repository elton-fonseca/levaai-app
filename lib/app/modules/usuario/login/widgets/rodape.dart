import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/view/tamanhos_relativos.dart';

class Rodape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(displayWidth(context) * 0.031),
      child: Column(
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
                  Modular.to.pushNamed('/login/trocar/senha/token');
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
      ),
    );
  }
}
