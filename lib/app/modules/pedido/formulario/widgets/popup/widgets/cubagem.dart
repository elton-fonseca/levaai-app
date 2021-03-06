import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../popup_controller.dart';

class Cubagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var moneyMaskedTextController = MoneyMaskedTextController(
      decimalSeparator: '.',
      thousandSeparator: '',
      precision: 2,
    );
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
                controller: moneyMaskedTextController,
                onChanged: (valor) => Modular.get<PopupController>().cubagem =
                    moneyMaskedTextController.numberValue,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(13),
                  hintText: 'Cubagem',
                  hintStyle: TextStyle(
                    fontSize: 15,
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
