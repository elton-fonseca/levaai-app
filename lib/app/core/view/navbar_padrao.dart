import 'package:flutter/material.dart';
import '../tema/cores_const.dart';

import 'tamanhos_relativos.dart';

class NavbarPadrao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: displayWidth(context) * 0.07),
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        Padding(
            padding:
                EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
            child: Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            })),
      ],
      backgroundColor: CoresConst.azulPadrao,
    );
  }
}
