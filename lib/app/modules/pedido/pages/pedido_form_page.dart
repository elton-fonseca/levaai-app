import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/tema/cores_const.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/menu_lateral.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../controllers/pedido_form_controller.dart';
import 'widgets/dropdown_peso.dart';
import 'widgets/dropdown_tipo.dart';
import 'widgets/popup/popup_show.dart';

class PedidoFormPage extends StatefulWidget {
  final String title;
  const PedidoFormPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoFormPageState createState() => _PedidoFormPageState();
}

class _PedidoFormPageState
    extends ModularState<PedidoFormPage, PedidoFormController> {
  //use 'controller' variable to access controller

  //final _itens = List<String>.generate(10, (i) => "Item $i");
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF2E4983), Color(0xFF005BC3)])),
        child: Scaffold(
          appBar: NavbarPadrao().build(context),
          drawer: MenuLateral(),
          backgroundColor: Colors.transparent,
          body: ConteudoPadrao(
            textoCabecalho: Text(
              'Configure o seu pedido',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: displayWidth(context) * 0.04,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            conteudo: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: displayWidth(context) * 0.04,
                    top: displayHeight(context) * 0.02),
                child: Row(children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: displayHeight(context) * 0.13,
                        child: Image(
                            image: AssetImage('assets/origem-destino.png')),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: displayWidth(context) * 0.02,
                        top: displayHeight(context) * 0.01),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: displayWidth(context) * 0.85,
                          height: displayHeight(context) * 0.1,
                          child: TextFormField(
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey[600],
                              fontSize: displayWidth(context) * 0.032,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: displayWidth(context) * 0.035,
                                fontWeight: FontWeight.bold,
                              ),
                              labelText: 'Origem',
                              hintText: 'Avenida Paulsita, 234',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: displayWidth(context) * 0.85,
                          height: displayHeight(context) * 0.1,
                          child: TextFormField(
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey[600],
                              fontSize: displayWidth(context) * 0.032,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: displayWidth(context) * 0.035,
                                fontWeight: FontWeight.bold,
                              ),
                              labelText: 'Destino',
                              hintText: 'Avenida Faria lima, 344',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(height: displayHeight(context) * 0.04),
              Text(
                'Quantidade de Volumes:',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: displayWidth(context) * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: displayHeight(context) * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: displayHeight(context) * 0.18,
                    width: displayHeight(context) * 0.18,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
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
                        children: <Widget>[
                          Text(
                            'TAMANHO'
                            '\nAPROXIMADO',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                              fontSize: displayWidth(context) * 0.025,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Image(
                              image: AssetImage('assets/tamanho-relativo.png')),
                          Text(
                            'MICROONDAS',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                              fontSize: displayWidth(context) * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                  ),
                  Container(
                    height: displayHeight(context) * 0.18,
                    width: displayHeight(context) * 0.18,
                    decoration: BoxDecoration(
                      color: Color(0xFFf0eef1),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
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
                        children: <Widget>[
                          Text(
                            'TAMANHO'
                            '\nAPROXIMADO',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                              fontSize: displayWidth(context) * 0.025,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Image(
                              image: AssetImage('assets/tamanho-relativo.png')),
                          Text(
                            'MICROONDAS',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                              fontSize: displayWidth(context) * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: displayWidth(context) * 0.033),
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
                            padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.01),
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
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.01),
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
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
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
                        children: <Widget>[
                          Text(
                            'TAMANHO'
                            '\nAPROXIMADO',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                              fontSize: displayWidth(context) * 0.025,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Image(
                              image: AssetImage('assets/tamanho-relativo.png')),
                          Text(
                            'MICROONDAS',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                              fontSize: displayWidth(context) * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                  ),
                  Container(
                    height: displayHeight(context) * 0.18,
                    width: displayHeight(context) * 0.18,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
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
                        children: <Widget>[
                          Text(
                            'TAMANHO'
                            '\nAPROXIMADO',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                              fontSize: displayWidth(context) * 0.025,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Image(
                              image: AssetImage('assets/tamanho-relativo.png')),
                          Text(
                            'MICROONDAS',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                              fontSize: displayWidth(context) * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]),
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
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.01),
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
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.01),
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
              SizedBox(height: displayHeight(context) * 0.08),
              Container(
                width: displayWidth(context) * 0.7,
                height: displayHeight(context) * 0.07,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    border: Border.all(
                      width: 3,
                      color: CoresConst.azulPadrao,
                    )),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Tenho medidas exatas",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: CoresConst.azulPadrao,
                            fontSize: displayWidth(context) * 0.04,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () {
                      PopupShow().showPopup(context, 'Medidas');
                    },
                  ),
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.08),
              Container(
                height: displayHeight(context) * 0.25,
                width: displayWidth(context) * 0.95,
                decoration: BoxDecoration(
                  color: Color(0xfff7f9f8),
                  borderRadius: BorderRadius.all(const Radius.circular(15.0)),
                  boxShadow: [
                    BoxShadow(
                      color: CoresConst.azulPadrao.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 15,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            right: displayWidth(context) * 0.025,
                            left: displayWidth(context) * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(children: <Widget>[
                              Text(
                                'Valor Total',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              )
                            ]),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  width: displayWidth(context) * 0.5,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.grey[600],
                                      fontSize: displayWidth(context) * 0.032,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.end,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          'Digite aqui o valor total dos itens',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.grey[600],
                                        fontSize: displayWidth(context) * 0.032,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        height: 2,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: displayWidth(context) * 0.025,
                            left: displayWidth(context) * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(children: <Widget>[
                              Text(
                                'Peso total estimado',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              )
                            ]),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  child: DropdownPeso(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        height: 2,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: displayWidth(context) * 0.025,
                            left: displayWidth(context) * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(children: <Widget>[
                              Text(
                                'Tipo',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              )
                            ]),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  child: DropdownTipo(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              SizedBox(height: displayHeight(context) * 0.08),
              Container(
                width: displayWidth(context) * 0.7,
                height: displayHeight(context) * 0.07,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: CoresConst.azulPadrao,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    border: Border.all(
                      width: 3,
                      color: CoresConst.azulPadrao,
                    )),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Verificar Valor",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: displayWidth(context) * 0.04,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Modular.to.pushNamed('/pedido/cotacao');
                    },
                  ),
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.08),
            ]),
          ),
        ),
      ),
    );
  }
}
