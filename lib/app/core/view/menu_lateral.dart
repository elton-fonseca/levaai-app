import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../services/local_storage.dart';

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
              'assets/imagens/logo.png',
            )),
          ),
          ListTile(
              leading: Icon(Icons.add),
              title: Text("Criar pedido"),
              subtitle: Text("Solicite um novo pedido"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Modular.to.popAndPushNamed('/pedido/formulario/0/criar');
              }),
          ListTile(
              leading: Icon(Icons.list),
              title: Text("Listar Pedidos"),
              subtitle: Text("Veja o status de cada pedido"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Modular.to.pushNamed('/rastreamento/lista');
              }),
          ListTile(
              leading: Icon(Icons.assignment_return),
              title: Text("Sair"),
              subtitle: Text("Deslogar do sistema"),
              onTap: () {
                LocalStorage.removeValue('token').then((value) {
                  Modular.get<Dio>().options.headers.remove('Authorization');
                  Modular.to.popUntil(ModalRoute.withName('/'));
                  Modular.to.pushNamed('/');
                });
              }),
          ListTile(
              leading: Icon(Icons.assignment_return),
              title: Text("temp"),
              subtitle: Text("temporário"),
              onTap: () {
                Modular.to.pushNamed('/pagamento');
              }),
        ],
      ),
    );
  }
}
