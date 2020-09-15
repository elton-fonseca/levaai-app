import 'package:flutter/material.dart';
import '../../../../../core/view/tamanhos_relativos.dart';

class DropdownTipo extends StatefulWidget {
  @override
  _DropdownTipoState createState() {
    return _DropdownTipoState();
  }
}

class _DropdownTipoState extends State<DropdownTipo> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: [
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
            setState(() {
              _value = value;
            });
          },
          hint: Text(
            'Tipo de item',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: displayWidth(context) * 0.032,
            ),
          ),
          value: _value,
        ),
      ),
    );
  }
}
