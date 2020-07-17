import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Wesley Zik4"),
            accountEmail: Text("wesleygado@gmail.com"),
            currentAccountPicture: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://instagram.fcgh17-1.fna.fbcdn.net/v/t51.2885-19/s150x150/66309440_2110943429211851_1333632537053888512_n.jpg?_nc_ht=instagram.fcgh17-1.fna.fbcdn.net&_nc_ohc=ZH4y-CseiWEAX837pnQ&oh=129896061251f3c5ab11234379884bd5&oe=5F3B9C89'),
              backgroundColor: Colors.transparent,
            ),
          ),
          ListTile(
              leading: Icon(Icons.add),
              title: Text("Tela 1 Fundo Azul"),
              subtitle: Text("Variação Tela 1"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {}),
          ListTile(
              leading: Icon(Icons.add_location),
              title: Text("Endereços"),
              subtitle: Text("Gerencias endereços"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                debugPrint('faz nada também');
              })
        ],
      ),
    );
  }
}
