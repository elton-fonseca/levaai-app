import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/view/tamanhos_relativos.dart';
import '../detalhes_controller.dart';

class DropdownPeso extends StatefulWidget {
  @override
  _DropdownPesoState createState() {
    return _DropdownPesoState();
  }
}

class _DropdownPesoState extends State<DropdownPeso> {
  String selected = Modular.get<DetalhesController>().pegaPesoTotal();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: [
            DropdownMenuItem<String>(
              child: Text(
                'Peso aproximado',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: "selecione",
            ),
            DropdownMenuItem<String>(
              child: Text(
                'De 0 a 10kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: "9",
            ),
            DropdownMenuItem<String>(
              child: Text(
                'De 10kg a 20kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: '19',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'De 20kg a 50kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: '49',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'De 50kg a 70kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: '69',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'De 70kg a 100kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: '99',
            ),
          ],
          onChanged: (value) {
            setState(() => selected = value);

            Modular.get<DetalhesController>().definePesoTotal(value);
          },
          value: selected,
        ),
      ),
    );
  }
}
