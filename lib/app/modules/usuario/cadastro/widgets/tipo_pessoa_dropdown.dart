import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/view/tamanhos_relativos.dart';
import '../cadastro_controller.dart';

class TipoPessoaDropdown extends StatefulWidget {
  const TipoPessoaDropdown({this.documentoTextController});

  final TextEditingController documentoTextController;

  @override
  _TipoPessoaDropdownState createState() {
    return _TipoPessoaDropdownState();
  }
}

class _TipoPessoaDropdownState extends State<TipoPessoaDropdown> {
  String selected = Modular.get<CadastroController>().pegaTipoPessoa();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.0, style: BorderStyle.solid, color: Colors.grey[500]),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: displayWidth(context) * 0.05,
          right: displayWidth(context) * 0.05,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            items: [
              DropdownMenuItem<String>(
                child: Text(
                  'Pessoa Física',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ),
                value: 'PF',
              ),
              DropdownMenuItem<String>(
                child: Text(
                  'Pessoa jurídica',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ),
                value: 'PJ',
              ),
            ],
            onChanged: (value) {
              setState(() => selected = value);

              Modular.get<CadastroController>()
                  .defineTipoPessoa(value, widget.documentoTextController);
            },
            value: selected,
          ),
        ),
      ),
    );
  }
}
