import 'package:flutter/material.dart';
import '../../../../core/view/tamanhos_relativos.dart';

class DropdownPeso extends StatefulWidget {
  @override
  _DropdownPesoState createState() {
    return _DropdownPesoState();
  }
}

class _DropdownPesoState extends State<DropdownPeso> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: [
            DropdownMenuItem<String>(
              child: Text(
                'De 0 a 5kg',
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
                'De 6kg a 10kg',
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
                'De 11kg a 20kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'trhee',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'De 21kg a 30kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'for',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'De 31kg a 40kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'five',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'De 41kg a 50kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'six',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'De 51kg a 100kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'seven',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'De 101kg a 300kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'eight',
            ),
            DropdownMenuItem<String>(
              child: Text(
                'Acima 300kg',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
              value: 'nine',
            ),
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          hint: Text(
            'Peso aproximado',
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
