import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/view/tamanhos_relativos.dart';

class InputText extends StatelessWidget {
  InputText({
    @required this.placeholder,
    this.tipo = 'texto',
    this.alinhamento = 'esquerda',
    @required this.tamanho,
    @required this.textController,
    @required this.onChange,
  });

  final String placeholder;
  final String tipo;
  final String alinhamento;
  final int tamanho;
  final TextEditingController textController;
  final void Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: textController,
      inputFormatters: [
        LengthLimitingTextInputFormatter(tamanho),
      ],
      style: TextStyle(
        fontFamily: 'Roboto',
        color: Color(0xFF909090),
        fontSize: displayWidth(context) * 0.032,
      ),
      textAlign: alinhamento == 'esquerda' ? TextAlign.left : TextAlign.right,
      keyboardType: tipo == 'texto' ? TextInputType.text : TextInputType.number,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(bottom: displayWidth(context) * 0.06),
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Color(0xFF909090),
          fontSize: displayWidth(context) * 0.032,
        ),
      ),
    );
  }
}
