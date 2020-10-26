import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/view/tamanhos_relativos.dart';
import 'popup_controller.dart';

class PopupCorpo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 50, top: 0, right: 50, bottom: 0),
            child: Text(
              'Adicionar um novo item usando medidas exatas.\n'
              'A medida usada deve ser centímetro.',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset("assets/imagens/box.png"),
          ),
          SizedBox(height: 40),
          Padding(
            padding:
                const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFF326699),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFFFFFFFF),
                      )),
                  child: SizedBox(
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Dimensões",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Modular.get<PopupController>().definirFormDimensoes();
                      },
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFF326699),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFFFFFFFF),
                      )),
                  child: SizedBox(
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Cubagem",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Modular.get<PopupController>().definirFormCubagem();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Observer(builder: (_) {
            return Modular.get<PopupController>().tipoForm;
          }),
          SizedBox(height: 40),
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  child: IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      color: Color(0xFF98c11c),
                      size: displayWidth(context) * 0.07,
                    ),
                    onPressed: () {
                      Modular.get<PopupController>().rmQuantidade();
                    },
                  ),
                ),
                SizedBox(
                  child: Observer(builder: (_) {
                    return Text(
                      Modular.get<PopupController>().quantidade.toString(),
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }),
                ),
                SizedBox(
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Color(0xFF98c11c),
                      size: displayWidth(context) * 0.07,
                    ),
                    onPressed: () {
                      Modular.get<PopupController>().addQuantidade();
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            width: 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF98c11c),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: SizedBox.expand(
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Adicionar Item(s)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                onPressed: () {
                  Modular.get<PopupController>().adicionarItemPedido(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
