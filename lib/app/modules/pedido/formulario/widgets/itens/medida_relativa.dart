import 'package:flutter/material.dart';

import '../../../../../core/tema/cores_const.dart';
import '../../../../../core/view/tamanhos_relativos.dart';
import 'item-relativo.dart';

class MedidaRelativa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: displayHeight(context) * 0.18,
              width: displayHeight(context) * 0.18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(const Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: CoresConst.azulPadrao.withOpacity(0.05),
                    spreadRadius: 10,
                    blurRadius: 13,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ItemRelativo().imagem(
                  context: context,
                  imagem: '/assets/imagens/tamanho-relativo.png',
                  descricao: 'Microondas',
                ),
              ),
            ),
            Container(
              height: displayHeight(context) * 0.18,
              width: displayHeight(context) * 0.18,
              decoration: BoxDecoration(
                color: Color(0xFFf0eef1),
                borderRadius: BorderRadius.all(const Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: CoresConst.azulPadrao.withOpacity(0.05),
                    spreadRadius: 10,
                    blurRadius: 13,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ItemRelativo().imagem(
                    context: context,
                    imagem: '/assets/imagens/geladeira.svg',
                    descricao: 'Microondas'),
              ),
            ),
          ],
        ),
        SizedBox(height: displayHeight(context) * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: displayWidth(context) * 0.033),
              child: SizedBox(
                width: displayHeight(context) * 0.185,
                child: Container(
                  child: Row(children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.grey,
                        size: displayWidth(context) * 0.07,
                      ),
                      onPressed: () {},
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: displayWidth(context) * 0.01),
                      child: Text(
                        '0',
                        style: TextStyle(
                          color: CoresConst.azulPadrao,
                          fontSize: displayWidth(context) * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.grey,
                        size: displayWidth(context) * 0.07,
                      ),
                      onPressed: () {},
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              width: displayHeight(context) * 0.185,
              child: Container(
                child: Row(children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.grey,
                      size: displayWidth(context) * 0.07,
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: displayWidth(context) * 0.01),
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: CoresConst.azulPadrao,
                        fontSize: displayWidth(context) * 0.07,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.grey,
                      size: displayWidth(context) * 0.07,
                    ),
                    onPressed: () {},
                  ),
                ]),
              ),
            ),
          ],
        ),
        SizedBox(height: displayHeight(context) * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: displayHeight(context) * 0.18,
              width: displayHeight(context) * 0.18,
              decoration: BoxDecoration(
                color: Color(0xFFf0eef1),
                borderRadius: BorderRadius.all(const Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: CoresConst.azulPadrao.withOpacity(0.05),
                    spreadRadius: 10,
                    blurRadius: 13,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ItemRelativo().imagem(
                    context: context,
                    imagem: '/assets/imagens/tamanho-relativo.png',
                    descricao: 'Microondas'),
              ),
            ),
            Container(
              height: displayHeight(context) * 0.18,
              width: displayHeight(context) * 0.18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(const Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: CoresConst.azulPadrao.withOpacity(0.05),
                    spreadRadius: 10,
                    blurRadius: 13,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ItemRelativo().imagem(
                    context: context,
                    imagem: '/assets/imagens/tamanho-relativo.png',
                    descricao: 'Microondas'),
              ),
            ),
          ],
        ),
        SizedBox(height: displayHeight(context) * 0.02),
        Padding(
          padding: EdgeInsets.only(left: displayWidth(context) * 0.030),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: displayHeight(context) * 0.185,
                child: Row(children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.grey,
                      size: displayWidth(context) * 0.07,
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: displayWidth(context) * 0.01),
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: CoresConst.azulPadrao,
                        fontSize: displayWidth(context) * 0.07,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.grey,
                      size: displayWidth(context) * 0.07,
                    ),
                    onPressed: () {},
                  ),
                ]),
              ),
              Container(
                width: displayHeight(context) * 0.185,
                child: Row(children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.grey,
                      size: displayWidth(context) * 0.07,
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: displayWidth(context) * 0.01),
                    child: Text(
                      '0',
                      style: TextStyle(
                        color: CoresConst.azulPadrao,
                        fontSize: displayWidth(context) * 0.07,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.grey,
                      size: displayWidth(context) * 0.07,
                    ),
                    onPressed: () {},
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
