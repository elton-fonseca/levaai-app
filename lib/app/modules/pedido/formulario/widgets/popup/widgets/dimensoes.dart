import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../popup_controller.dart';

class Dimensoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Color(0xFF326699),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                  width: 1,
                  color: Color(0xFFFFFFFF),
                )),
            child: SizedBox(
              child: TextFormField(
                onChanged: (valor) => Modular.get<PopupController>()
                    .defineLargura(int.parse(valor)),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(13),
                  hintText: 'Largura',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Color(0xFF326699),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                  width: 1,
                  color: Color(0xFFFFFFFF),
                )),
            child: SizedBox(
              child: TextFormField(
                onChanged: (valor) => Modular.get<PopupController>()
                    .defineAltura(int.parse(valor)),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(13),
                  hintText: 'Altura',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Color(0xFF326699),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                  width: 1,
                  color: Color(0xFFFFFFFF),
                )),
            child: SizedBox(
              child: TextFormField(
                onChanged: (valor) => Modular.get<PopupController>()
                    .defineComprimento(int.parse(valor)),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Comprimento',
                  hintStyle: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
