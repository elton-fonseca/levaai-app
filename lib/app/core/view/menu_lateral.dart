import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Elton Fonseca"),
            accountEmail: Text("eltonfonseca@elton.com.br"),
            currentAccountPicture: Image(
                image: AssetImage(
              'assets/logo.png',
            )),
          ),
          ListTile(
              leading: Icon(Icons.add),
              title: Text("Criar pedido"),
              subtitle: Text("Solicite um novo pedido"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Modular.to.pushNamed('/pedido/form');
              }),
          ListTile(
              leading: Icon(Icons.list),
              title: Text("Listar Pedidos"),
              subtitle: Text("Veja o status de cada pedido"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Modular.to.pushNamed('/pedido/listar');
              }),
        ],
      ),
    );
  }
}
