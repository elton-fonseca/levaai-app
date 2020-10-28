import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/view/tamanhos_relativos.dart';
import '../detalhes_controller.dart';

// ignore: must_be_immutable
class DropdownPeso extends StatefulWidget {
  @override
  _DropdownPesoState createState() {
    return _DropdownPesoState();
  }

  DropdownPeso(this.pesoTextController);

  TextEditingController pesoTextController;
}

class _DropdownPesoState extends State<DropdownPeso> {
  String selected = Modular.get<DetalhesController>().pegaPesoTotal();

  @override
  Widget build(BuildContext context) {
    if (Modular.get<DetalhesController>().pesoExato() == true) {
      return SizedBox(
        width: displayWidth(context) * 0.5,
        child: TextFormField(
          controller: widget.pesoTextController,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.grey[600],
            fontSize: displayWidth(context) * 0.032,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.end,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '000 kg',
            hintStyle: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.grey[600],
              fontSize: displayWidth(context) * 0.032,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

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
            DropdownMenuItem<String>(
              child: Text(
                'Peso Exato',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'peso-exato',
            ),
          ],
          onChanged: (value) {
            setState(() => selected = value);

            if (value == 'peso-exato') {
              Modular.get<DetalhesController>().definePesoExato();
            }

            Modular.get<DetalhesController>().definePesoTotal(value);
          },
          value: selected,
        ),
      ),
    );
  }
}
