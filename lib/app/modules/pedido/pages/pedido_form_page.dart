import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/tema/cores_const.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../controllers/pedido_form_controller.dart';

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
      body: Scaffold(
        appBar: NavbarPadrao().build(context),
        backgroundColor: CoresConst.azulPadrao,
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
                  left: displayWidth(context) * 0.07,
                  top: displayHeight(context) * 0.02),
              child: Row(children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: displayHeight(context) * 0.13,
                      child:
                          Image(image: AssetImage('assets/origem-destino.png')),
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
                        width: displayWidth(context) * 0.76,
                        height: displayHeight(context) * 0.1,
                        child: TextFormField(
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
                        width: displayWidth(context) * 0.76,
                        height: displayHeight(context) * 0.1,
                        child: TextFormField(
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
                        Image(image: AssetImage('assets/tamanho-relativo.png')),
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
                        Image(image: AssetImage('assets/tamanho-relativo.png')),
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
                        Image(image: AssetImage('assets/tamanho-relativo.png')),
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
                        Image(image: AssetImage('assets/tamanho-relativo.png')),
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
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(height: displayHeight(context) * 0.08),
            Container(
              height: displayHeight(context) * 0.25,
              width: displayWidth(context) * 0.85,
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
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFe9ebea), width: 4),
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: displayWidth(context) * 0.05),
                                hintText: ''
                                    'Valor Total',
                                hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFe9ebea), width: 4),
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: displayWidth(context) * 0.05),
                                hintText: 'Peso Total Estimado',
                                hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFe9ebea), width: 0),
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: displayWidth(context) * 0.05),
                                hintText: ''
                                    'Tipo',
                                hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                  fontSize: displayWidth(context) * 0.032,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(height: displayHeight(context) * 0.08),
            Container(
              width: displayWidth(context) * 0.7,
              height: displayHeight(context) * 0.07,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: CoresConst.verdepadrao,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  border: Border.all(
                    width: 3,
                    color: CoresConst.verdepadrao,
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
    );
  }
}
