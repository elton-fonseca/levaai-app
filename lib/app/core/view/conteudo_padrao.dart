import 'package:flutter/material.dart';

import 'tamanhos_relativos.dart';

class ConteudoPadrao extends StatelessWidget {

  const ConteudoPadrao({this.textoCabecalho, this.conteudo,});

  final Widget textoCabecalho;

  final Widget conteudo;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.09,
                      bottom: displayHeight(context) * 0.04,
                      top: displayHeight(context) * 0.01),
                  child: textoCabecalho,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    constraints: BoxConstraints(
              minHeight: displayHeight(context)*0.73),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                        ),),
                    width: displayWidth(context) * 1,
                    child: conteudo
                  ),
                ),
          ],
          ),
        );
  }
}
