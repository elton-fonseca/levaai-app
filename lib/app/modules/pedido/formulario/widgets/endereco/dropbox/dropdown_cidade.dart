import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../core/view/tamanhos_relativos.dart';
import '../endereco_controller.dart';

class DropdownCidade extends StatefulWidget {
  final List cidadesAtendidas;

  final String tipo;

  const DropdownCidade(this.cidadesAtendidas, this.tipo);

  @override
  _DropdownCidadeState createState() {
    return _DropdownCidadeState();
  }
}

class _DropdownCidadeState extends State<DropdownCidade> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: widget.cidadesAtendidas.map((cidade) {
            return DropdownMenuItem<String>(
              value: cidade['CODMUN_CID'],
              child: Text(
                "${cidade['NOME_CID']} - ${cidade['ESTADO_CID']}",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.032,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            //setState(() => selected = value);

            Modular.get<EnderecoController>().defineCidade(value, widget.tipo);
          },
          value: Modular.get<EnderecoController>().pegaCidade(widget.tipo),
        ),
      ),
    );
  }
}
