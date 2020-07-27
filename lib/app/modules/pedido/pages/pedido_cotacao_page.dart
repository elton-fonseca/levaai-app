import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../pedido_controller.dart';

class PedidoCotacaoPage extends StatefulWidget {
  final String title;
  const PedidoCotacaoPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoCotacaoPageState createState() => _PedidoCotacaoPageState();
}

class _PedidoCotacaoPageState
    extends ModularState<PedidoCotacaoPage, PedidoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Color((0xFF326699)),),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Cofirmar pedido",
          style: TextStyle(
            color: Color(0xFF326699),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
              top: 0,
              left: 30,
              right: 30,
            ),
            color: Color(0xFFFFFFFF),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Valor',
                    style: TextStyle(
                      color: Color(0xFF326699),
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'RS400,00',
                    style: TextStyle(
                      color: Color(0xFF326699),
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Data de Coleta',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Prevista entre 20/06 e 23/06',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Data de entrega',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Prevista entre 24/06 e 27/06',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 15),
                  Divider(
                      color: Colors.grey[600],
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFFf4f5f7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded (
                            child: SizedBox(
                              child: Text(
                                'Responsável Coleta',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),),
                          Expanded (
                            child: SizedBox(
                              child: Text(
                                'João Paulo',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFFf4f5f7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded (
                            child: SizedBox(
                              child: Text(
                                'Tel Resp. Coleta',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),),
                          Expanded (
                            child: SizedBox(
                              child: Text(
                                '(11) 9.7070-7070',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        children: <Widget>[
                          Checkbox(value: false, onChanged: null),
                          Expanded (
                            child: SizedBox(
                              child: Text(
                                'Mesmo Cadastro',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFFf4f5f7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded (
                            child: SizedBox(
                              child: Text(
                                'Responsável Coleta',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),),
                          Expanded (
                            child: SizedBox(
                              child: Text(
                                'Rafaela Silva',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFFf4f5f7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded (
                            child: SizedBox(
                              child: Text(
                                'Tel Resp. Coleta',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),),
                          Expanded (
                            child: SizedBox(
                              child: Text(
                                '(11) 9.6780-5838',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        children: <Widget>[
                          Checkbox(value: false, onChanged: null),
                          Expanded (
                            child: SizedBox(
                              child: Text(
                                'Mesmo Cadastro',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),),
                        ],
                      ),
                    ),
                  ),
              ]
            ),
          ),
      ),
    );
  }
}
