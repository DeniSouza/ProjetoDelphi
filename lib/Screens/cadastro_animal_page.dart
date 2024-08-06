import 'package:flutter/material.dart';
import 'package:projeto_delphi/Utils/utils.dart';
import 'package:provider/provider.dart';

class CadastroAnimal extends StatefulWidget {
  const CadastroAnimal({Key? key}) : super(key: key);

  @override
  _CadastroAnimalState createState() => _CadastroAnimalState();
}

class _CadastroAnimalState extends State<CadastroAnimal> {
  final formKey = GlobalKey<FormState>();
  final nomeAnimal = TextEditingController();
  final idade = TextEditingController();
  String especie = 'Cachorro';
  final raca = TextEditingController();
  List listaespecie = ['Cachorro', 'Gato', 'Pássaro', 'Tartaruga'];

  registraAnimal() async {
    try {
      await context
          .read<RegistroAnimal>()
          .registraAnimal(nomeAnimal.text, idade.text, raca.text, especie);
    } on ExcecaoRegistroAnimal catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Pet'),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: nomeAnimal,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              labelText: 'Nome do animal',
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: idade,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Idade do animal',
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(height: 10.0),
                        DropdownButton(
                          hint: const Text('Selecione a Espécie'),
                          value: especie,
                          onChanged: (newValue) {
                            setState(() {
                              especie = newValue as String;
                            });
                          },
                          items: listaespecie.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                        TextField(
                          controller: raca,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              labelText: 'Raça do animal',
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () async {
                            if (context.read<AuthService>().usuario != null) {
                              await registraAnimal();
                              Navigator.of(context).pushNamed('/Home');
                            }
                          },
                          child: const Text('Cadastrar Pet'),
                        )
                      ])))),
      drawer: Drawer(
          child: Column(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              child: Icon(Icons.people),
            ),
            accountName: Text('Usuario'),
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
              })
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notificações"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: "Adicionar animal"),
          BottomNavigationBarItem(
              icon: Icon(Icons.store), label: "Marketplace"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city), label: "Mapa"),
        ],
      ),
    );
  }
}
