import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/modules/pedido/formulario/formulario_controller.dart';

class MedidaExata extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C', 'A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100, 600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
              height: 200.0,
              child: Observer(
                builder: (context) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    scrollDirection: Axis.vertical,
                    itemCount: Modular.get<FormularioController>()
                        .pegarListaMedidaExata()
                        .length,
                    itemBuilder: (context, index) {
                      var lista = Modular.get<FormularioController>()
                          .pegarListaMedidaExata();
                      return Column(
                        children: [
                          Container(
                            child: Center(
                              child: FlatButton(
                                onPressed: () {
                                  lista.removeAt(index);
                                },
                                child: Text('apagar'),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                // ignore: lines_longer_than_80_chars
                                'Tamanho ${lista[index].largura}x${lista[index].altura}x${lista[index].comprimento}',
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              )),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
