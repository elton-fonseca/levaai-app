import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../pagamento_controller.dart';

class DropdownPagamento extends StatefulWidget {
  @override
  _DropdownPagamentoState createState() {
    return _DropdownPagamentoState();
  }
}

class _DropdownPagamentoState extends State<DropdownPagamento> {
  String selected = Modular.get<PagamentoController>().pegaTipoPagamento();

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
                  'Cartão de crédito',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ),
                value: 'cartao',
              ),
              DropdownMenuItem<String>(
                child: Text(
                  'Boleto Bancário',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ),
                value: 'boleto',
              ),
            ],
            onChanged: (value) {
              setState(() => selected = value);

              Modular.get<PagamentoController>().defineTipoPagamento(value);
            },
            value: selected,
          ),
        ),
      ),
    );
  }
}
