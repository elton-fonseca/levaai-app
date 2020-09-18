import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/tema/cores_const.dart';
import '../../../../../core/view/tamanhos_relativos.dart';
import 'item_relativo.dart';
import 'tipo_medida_controller.dart';

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
                  imagem: 'assets/imagens/caixa-sapato.png',
                  descricao: 'Caixa de Sapato',
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
                    imagem: 'assets/imagens/microondas.png',
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
                  child: Observer(builder: (_) {
                    return ItemRelativo().contador(
                      context: context,
                      onClickMais: () {
                        Modular.get<TipoMedidaController>()
                            .addItemCaixaSapato();
                      },
                      onClickMenos: () {
                        Modular.get<TipoMedidaController>().rmItemCaixaSapato();
                      },
                      quantidade:
                          Modular.get<TipoMedidaController>().itemCaixaSapato(),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              width: displayHeight(context) * 0.185,
              child: Container(
                child: Observer(builder: (_) {
                  return ItemRelativo().contador(
                    context: context,
                    onClickMais: () {
                      Modular.get<TipoMedidaController>().addItemMicroondas();
                    },
                    onClickMenos: () {
                      Modular.get<TipoMedidaController>().rmItemMicroondas();
                    },
                    quantidade:
                        Modular.get<TipoMedidaController>().itemMicroondas(),
                  );
                }),
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
                    imagem: 'assets/imagens/fogao.png',
                    descricao: 'Fogão'),
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
                  imagem: 'assets/imagens/geladeira.png',
                  descricao: 'Geladeira',
                ),
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
                child: Observer(builder: (_) {
                  return ItemRelativo().contador(
                    context: context,
                    onClickMais: () {
                      Modular.get<TipoMedidaController>().addItemFogao();
                    },
                    onClickMenos: () {
                      Modular.get<TipoMedidaController>().rmItemFogao();
                    },
                    quantidade: Modular.get<TipoMedidaController>().itemFogao(),
                  );
                }),
              ),
              Container(
                width: displayHeight(context) * 0.185,
                child: Observer(builder: (_) {
                  return ItemRelativo().contador(
                    context: context,
                    onClickMais: () {
                      Modular.get<TipoMedidaController>().addItemGeladeira();
                    },
                    onClickMenos: () {
                      Modular.get<TipoMedidaController>().rmItemGeladeira();
                    },
                    quantidade:
                        Modular.get<TipoMedidaController>().itemGeladeira(),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
