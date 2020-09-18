import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../core/view/tamanhos_relativos.dart';
import '../detalhes_controller.dart';

class DropdownTipo extends StatefulWidget {
  @override
  _DropdownTipoState createState() {
    return _DropdownTipoState();
  }
}

class _DropdownTipoState extends State<DropdownTipo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: [
            DropdownMenuItem<String>(
              child: Text(
                'Selecione',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'selecione',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'Eletronico',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'one',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'Roupa',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'two',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'Livro',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'three',
            ),
          ],
          onChanged: (value) {
            Modular.get<DetalhesController>().defineTipoMercadoria(value);
          },
          value: Modular.get<DetalhesController>().pegaTipoMercadoria(),
        ),
      ),
    );
  }
}
