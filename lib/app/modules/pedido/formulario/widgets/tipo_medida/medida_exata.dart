import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../core/view/tamanhos_relativos.dart';
import '../popup/popup_controller.dart';
import 'tipo_medida_controller.dart';

class MedidaExata extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C', 'A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100, 600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
            height: displayHeight(context) * 0.3,
            width: displayWidth(context) * 0.9,
            child: Observer(
              builder: (context) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  scrollDirection: Axis.vertical,
                  itemCount: Modular.get<TipoMedidaController>()
                      .pegarListaMedidaExata()
                      .length,
                  itemBuilder: (context, index) {
                    var lista = Modular.get<TipoMedidaController>()
                        .pegarListaMedidaExata();
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.05,
                              right: displayWidth(context) * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Item #N',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.grey[500],
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Qtd: N',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.grey[500],
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.05,
                              right: displayWidth(context) * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                Modular.get<PopupController>()
                                    .volumeFormatado(lista[index]),
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[500],
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            )),
      ],
    );
  }
}
