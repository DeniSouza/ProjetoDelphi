import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_delphi/utils/utils.dart';
import 'package:provider/provider.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  ConfiguracoesState createState() => ConfiguracoesState();
}

class ConfiguracoesState extends State<Configuracoes> {
  apagarUsuario() async {
    try {
      await context.read<RegistroUsuario>().apagarUsuario();
    } on ExcecaoRegistroUsuario catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Tema Escuro: '),
                      Switch(
                          value: AppController.instance.isDarkTheme,
                          onChanged: (value) {
                            AppController.instance.changeTheme();
                          }),
                    ]),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () async {
                    if (context.read<AuthService>().usuario != null) {
                      await apagarUsuario();
                    }
                  },
                  child: const Text('Apagar Conta'),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/Home');
                  },
                  child: const Text('Voltar'),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                child: Icon(Icons.people),
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
    );
  }
}
