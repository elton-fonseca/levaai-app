import 'package:flutter/material.dart';
import '../../../../../../core/view/tamanhos_relativos.dart';

class DropdownCidade extends StatefulWidget {
  final List cidadesAtendidas;

  const DropdownCidade(this.cidadesAtendidas);

  @override
  _DropdownCidadeState createState() {
    return _DropdownCidadeState();
  }
}

class _DropdownCidadeState extends State<DropdownCidade> {
  String selected =
      'selecione'; //Modular.get<DetalhesController>().pegaTipoMercadoria();

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
            setState(() => selected = value);

            //Modular.get<DetalhesController>().defineTipoMercadoria(value);
          },
          value: selected,
        ),
      ),
    );
  }
}
