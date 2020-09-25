import 'package:flutter/material.dart';
import '../../../core/view/tamanhos_relativos.dart';

class DetalhesPageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.5,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: displayWidth(context) * 0.039,
                          bottom: displayHeight(context) * 0.047),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            child: Icon(Icons.fiber_manual_record,
                                size: displayWidth(context) * 0.05,
                                color: Color(0xFF95c330)),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                "Pedido entregue",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.005,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                "20/10/2020",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[500],
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.005,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                "18:56h",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[500],
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: displayWidth(context) * 0.345),
                              child: Image.asset("assets/imagens/pedido-ok.png",
                                  width: displayHeight(context) * 0.048),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  color: Colors.white,
                  height: 10,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            );
          }),
    );
  }
}