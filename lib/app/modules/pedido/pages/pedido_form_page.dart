import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/core/view/navbar_padrao.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../../../core/tema/cores_const.dart';
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

  final _itens = List<String>.generate(10, (i) => "Item $i");

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
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
          conteudo: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: displayWidth(context) * 0.07,
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
                              width: displayWidth(context) * 0.76,
                              height: displayHeight(context) * 0.1,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
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
                        height: displayHeight(context) * 0.2,
                        width: displayHeight(context) * 0.2,
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
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                  image: AssetImage(
                                      'assets/tamanho-relativo.png')),
                              Text(
                                'MICROONDAS',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                      ),
                      Container(
                        height: displayHeight(context) * 0.2,
                        width: displayHeight(context) * 0.2,
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
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                  image: AssetImage(
                                      'assets/tamanho-relativo.png')),
                              Text(
                                'MICROONDAS',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
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
                                Icons.indeterminate_check_box,
                                color: Colors.grey,
                                size: 35,
                              ),
                              onPressed: () {
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: CoresConst.azulPadrao,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.grey,
                                size: 35,
                              ),
                              onPressed: () {
                              },
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
                                size: 35,
                              ),
                              onPressed: () {
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: CoresConst.azulPadrao,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.grey,
                                size: 35,
                              ),
                              onPressed: () {
                              },
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
                        height: displayHeight(context) * 0.2,
                        width: displayHeight(context) * 0.2,
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
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                  image: AssetImage(
                                      'assets/tamanho-relativo.png')),
                              Text(
                                'MICROONDAS',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                      ),
                      Container(
                        height: displayHeight(context) * 0.2,
                        width: displayHeight(context) * 0.2,
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
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                  image: AssetImage(
                                      'assets/tamanho-relativo.png')),
                              Text(
                                'MICROONDAS',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
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
                              size: 35,
                            ),
                            onPressed: () {
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: CoresConst.azulPadrao,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.grey,
                              size: 35,
                            ),
                            onPressed: () {
                            },
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
                              size: 35,
                            ),
                            onPressed: () {
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: CoresConst.azulPadrao,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.grey,
                              size: 35,
                            ),
                            onPressed: () {
                            },
                          ),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(height: displayHeight(context) * 0.08),
                  Container(
                    width: displayWidth(context) * 0.78,
                    height: displayHeight(context) * 0.08,
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
                                fontWeight: FontWeight.bold,
                                color: CoresConst.azulPadrao,
                                fontSize: 20,
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
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
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
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: ''
                                          'Valor Total',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
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
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: 'Peso Total Estimado',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
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
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: ''
                                          'Tipo',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
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
                    width: displayWidth(context) * 0.78,
                    height: displayHeight(context) * 0.08,
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
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onPressed: () {
                          Modular.to.pushNamed('/pedido/destalhes');
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
