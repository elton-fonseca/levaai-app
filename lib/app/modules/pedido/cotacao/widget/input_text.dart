import 'package:flutter/material.dart';
import '../../../../core/view/tamanhos_relativos.dart';

class InputText extends StatelessWidget {
  InputText({
    this.tipo = 'nome',
    @required this.textController,
    @required this.mascara,
    @required this.onChange,
  });

  final String tipo;
  final TextEditingController textController;
  final String mascara;
  final void Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: textController,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: Color(0xFF909090),
        fontSize: displayWidth(context) * 0.032,
      ),
      textAlign: tipo == 'nome' ? TextAlign.left : TextAlign.right,
      keyboardType: tipo == 'nome' ? TextInputType.name : TextInputType.number,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(bottom: displayWidth(context) * 0.06),
        hintText: tipo == 'nome' ? 'Nome Completo' : '(99) 99999-9999',
        hintStyle: TextStyle(
          color: Color(0xFF909090),
          fontSize: displayWidth(context) * 0.032,
        ),
      ),
    );
  }
}
