import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../pedido_controller.dart';


class PedidoFormPage extends StatefulWidget {
  final String title;
  const PedidoFormPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoFormPageState createState() => _PedidoFormPageState();
}

class _PedidoFormPageState
    extends ModularState<PedidoFormPage, PedidoController> {
  //use 'controller' variable to access controller

  final itens = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color((0xFF326699)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "LevaAí",
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Text(
              'Adicionar novo pedido',
              style: TextStyle(
                color: Color(0xFF326699),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 0,
                  ),
                  SizedBox(
                    width: 30,
                    height: 65,
                    child: Image.asset("assets/img-requests.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Origem',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Destino',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ]),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                  child: Text('Quantidade de volumes:',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  height: 430,
                  decoration: BoxDecoration(
                    color: Color(0xFFf4f5f7),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 350,
                            width: 280,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: itens.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    padding: EdgeInsets.only(
                                        left: 5,
                                        top: 10,
                                        bottom: 10,
                                        right: 10),
                                    height: 80,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 2,
                                                color: Colors.blueGrey))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('${itens[index]}',
                                            style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text('10cm X 20cm X 40cm',
                                                  style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 13,
                                                  )),
                                            ),
                                            Expanded(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  'Qtd: 03',
                                                  style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            )),
                                          ],
                                        )
                                      ],
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 250,
                        height: 45,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            border: Border.all(
                              width: 3,
                              color: Color(0xFF326699),
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
                                    color: Color(0xFF326699),
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            onPressed: () {
                              PopupContent()
                                  .showPopup(context, null, 'Medidas');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(children: <Widget>[
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF326699),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 50,
                        right: 50,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                'Valor Total',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                '400,00',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF5286b8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 50,
                        right: 50,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                'Peso estimado',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                '30kg',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF81b5e7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 50,
                        right: 50,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                'Tipo',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                'frágil',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 45,
                    width: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF98c11c),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
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
                          Modular.to.pushNamed('/pedido/cotacao');
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ])
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class PopupContent extends StatefulWidget {
  final Widget content;

  PopupContent({
    Key key,
    this.content,
  }) : super(key: key);

  _PopupContentState createState() => _PopupContentState();

  showPopup(BuildContext context, Widget widget, String title,
      {BuildContext popupContext}) {
    Navigator.push(
      context,
      PopupLayout(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: PopupContent(
          content: Scaffold(
            backgroundColor: Color(0xFF326699).withOpacity(0.9),
            appBar: AppBar(
              backgroundColor: Color(0xFF326699).withOpacity(0.9),
              elevation: 0,
              title: Text(''),
              leading: new Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    try {
                      Navigator.pop(context); //close the popup
                    } catch (e) {
                      //
                    }
                  },
                );
              }),
              brightness: Brightness.light,
            ),
            resizeToAvoidBottomPadding: false,
            body: widget,
          ),
        ),
      ),
    );
  }
}

class _PopupContentState extends State<PopupContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.content,
    );
  }
}

class PopupLayout extends ModalRoute {
  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor =>
      bgColor == null ? Colors.black.withOpacity(0.5) : bgColor;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => false;

  double top;
  double bottom;
  double left;
  double right;
  Color bgColor;
  final Widget child;

  PopupLayout(
      {Key key,
      this.bgColor,
      @required this.child,
      this.top,
      this.bottom,
      this.left,
      this.right});

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    if (top == null) this.top = 10;
    if (bottom == null) this.bottom = 20;
    if (left == null) this.left = 20;
    if (right == null) this.right = 20;

    return GestureDetector(
      onTap: () {
        // call this method here to hide soft keyboard
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Material(
        
        type: MaterialType.transparency,
        //type: MaterialType.canvas,
        // make sure that the overlay content is not cut off
        child: SafeArea(
          bottom: true,
          child: _buildOverlayContent(context),
        ),
      ),
    );
  }

  //the dynamic content pass by parameter
  Widget _buildOverlayContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: this.bottom,
          left: this.left,
          right: this.right,
          top: this.top),
      child: child,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}

class NewRequestWidget extends StatelessWidget {
  Widget _popupBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 50, top: 0, right: 50, bottom: 0),
            child: Text(
              'Adicione um novo pedido com as medidas exatas do(s) seu(s) item(s).',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset("assets/box.png"),
          ),
          SizedBox(height: 40),
          Padding(
            padding:
                const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFF326699),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFFFFFFFF),
                      )),
                  child: SizedBox(
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Dimensões",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFF326699),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFFFFFFFF),
                      )),
                  child: SizedBox(
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Cubagem",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFF326699),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFFFFFFF),
                      )),
                  child: SizedBox(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(13),
                        hintText: 'Largura',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFF326699),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFFFFFFF),
                      )),
                  child: SizedBox(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(13),
                        hintText: 'Altura',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFF326699),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFFFFFFF),
                      )),
                  child: SizedBox(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Comprimento',
                        hintStyle: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    child: Icon(
                  Icons.remove_circle,
                  color: Colors.grey,
                  size: 30,
                )),
                SizedBox(
                  child: Text(
                    '0',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                    child: Icon(
                  Icons.add_circle,
                  color: Color(0xFF98c11c),
                  size: 30,
                )),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            width: 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF98c11c),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: SizedBox.expand(
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Adicionar Item(s)",
                      style: TextStyle(
                        color: Colors.white,
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color((0xFF326699)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "LevaAí",
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Text(
              'Adicionar novo pedido',
              style: TextStyle(
                color: Color(0xFF326699),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 0,
                  ),
                  SizedBox(
                    width: 30,
                    height: 65,
                    child: Image.asset("assets/img-requests.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Origem',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Destino',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ]),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                  child: Text('Quantidade de volumes:',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  height: 430,
                  decoration: BoxDecoration(
                    color: Color(0xFFf4f5f7),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                                width: 200,
                                height: 150,
                                child: Image.asset("assets/item-request.png")),
                          ),
                          Expanded(
                            child: SizedBox(
                                width: 200,
                                height: 150,
                                child: Image.asset("assets/item-request.png")),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                                child: Icon(Icons.add_circle,
                                    color: Color(0xFF98c11c))),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Color(0xFF326699),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                                child: Icon(Icons.remove_circle,
                                    color: Color(0xFF98c11c))),
                          ),
                          Expanded(
                            child: SizedBox(
                                child: Icon(Icons.add_circle,
                                    color: Color(0xFF98c11c))),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Color(0xFF326699),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                                child: Icon(Icons.remove_circle,
                                    color: Color(0xFF98c11c))),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              width: 200,
                              height: 150,
                              child: Image.asset("assets/item-request.png"),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                                width: 200,
                                height: 150,
                                child: Image.asset("assets/item-request.png")),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                                child: Icon(Icons.add_circle,
                                    color: Color(0xFF98c11c))),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Color(0xFF326699),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                                child: Icon(Icons.remove_circle,
                                    color: Color(0xFF98c11c))),
                          ),
                          Expanded(
                            child: SizedBox(
                                child: Icon(Icons.add_circle,
                                    color: Color(0xFF98c11c))),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Color(0xFF326699),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                                child: Icon(Icons.remove_circle,
                                    color: Color(0xFF98c11c))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 250,
                        height: 45,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            border: Border.all(
                              width: 3,
                              color: Color(0xFF326699),
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
                                    color: Color(0xFF326699),
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            onPressed: () {
                              PopupContent()
                                  .showPopup(context, _popupBody(), 'Medidas');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(children: <Widget>[
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF326699),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 50,
                        right: 50,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                'Valor Total',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                '400,00',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF5286b8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 50,
                        right: 50,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                'Peso estimado',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                '30kg',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF81b5e7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 50,
                        right: 50,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                'Tipo',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                'frágil',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF98c11c),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
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
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ])
              ],
            )
          ]),
        ),
      ),
    );
  }
}
