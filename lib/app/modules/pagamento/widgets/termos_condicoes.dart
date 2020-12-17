import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../pagamento_controller.dart';

class TermosCondicoes extends StatefulWidget {
  @override
  _TermosCondicoesState createState() {
    return _TermosCondicoesState();
  }
}

class _TermosCondicoesState extends State<TermosCondicoes> {
  String selected = Modular.get<PagamentoController>().pegaTipoPagamento();

  bool checkedValue = false;

  TextStyle linkStyle = TextStyle(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: displayHeight(context) * 0.03,
        left: displayWidth(context) * 0.025,
        right: displayWidth(context) * 0.025,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: Container(
                color: Colors.red[100],
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: displayWidth(context) * 0.043,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Li e Aceito os ',
                            ),
                            TextSpan(
                              text: 'Termos e condições',
                              style: linkStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  var url =
                                      'https://www.levaai.com.br/termos-e-condicoes/';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Arquivo não encontrado';
                                  }
                                },
                            ),
                            TextSpan(
                              text: '. Estou ciente que a reentrega ou devoluçã'
                                  'o poderá ser cobrada.',
                            ),
                          ],
                        ),
                      ),
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                        });
                        Modular.get<PagamentoController>()
                            .defineStatusBotaoPagar(status: newValue);
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
