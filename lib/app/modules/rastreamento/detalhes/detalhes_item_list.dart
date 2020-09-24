import 'package:flutter/material.dart';

import '../../../core/view/tamanhos_relativos.dart';

class DetalhesItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.3,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: displayWidth(context) * 0.05,
                    left: displayWidth(context) * 0.05,
                    right: displayWidth(context) * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Item $index',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        'Qtd.: 1',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: displayWidth(context) * 0.05,
                    right: displayWidth(context) * 0.05,
                    bottom: displayWidth(context) * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '(90cm x 90cm x 90cm)',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.04,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: displayWidth(context) * 0.85,
                  child: Divider(
                    color: Colors.grey[300],
                    height: 2,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
