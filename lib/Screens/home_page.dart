import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_delphi/Utils/utils.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String nome = '';

  lerDadosUsuarios(String nome) async {
    try {
      await context.read<RegistroUsuario>().lerDadosUsuario(nome);
    } on ExcecaoRegistroUsuario catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
    return nome;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
                width: 350.0,
                height: 150.0,
                child: Card(
                  color: Colors.purple,
                  child: Padding(
                      padding: const EdgeInsets.all(
                        14.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/User.png'),
                                radius: 50.0,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[const Text("Usuário")],
                          ),
                        ],
                      )),
                ))),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                child: Icon(Icons.home),
              ),
              accountName: Text('Usuário'),
              accountEmail: Text('usuario@teste.com'),
            ),
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Inicio'),
                onTap: () {
                  Navigator.of(context).pushNamed('/Home');
                }),
            ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Adicionar Pet'),
                onTap: () {
                  Navigator.of(context).pushNamed('/CadastroAnimal');
                }),
            ListTile(
                leading: const Icon(Icons.map),
                title: const Text('Mapa de lojas'),
                onTap: () {
                  Navigator.of(context).pushNamed('/Mapa');
                }),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap: () {
                  Navigator.of(context).pushNamed('/Configuracoes');
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notificações"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Adicionar animal",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.store), label: "Marketplace"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city), label: "Mapa"),
        ],
      ),
    );
  }
}
