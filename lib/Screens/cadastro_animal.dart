import 'package:flutter/material.dart';

class CadastroAnimal extends StatefulWidget {
  const CadastroAnimal({Key? key}) : super(key: key);

  @override
  _CadastroAnimalState createState() => _CadastroAnimalState();
}

class _CadastroAnimalState extends State<CadastroAnimal> {
  String nome_animal = '';
  String idade = '';
  String especie = 'Cachorro';
  String raca = '';
  List listaespecie = ['Cachorro', 'Gato', 'Pássaro', 'Tartaruga'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Pet'),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text) {
                    nome_animal = text;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Nome Animal', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10.0),
                TextField(
                  onChanged: (text) {
                    idade = text;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Idade', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10.0),
                DropdownButton(
                  hint: Text('Selecione a Espécie'),
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
                  onChanged: (text) {
                    raca = text;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Raça', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Home');
                  },
                  child: Text('Cadastrar Pet'),
                )
              ],
            ),
          ),
        )),
        drawer: Drawer(
            child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                child: Icon(Icons.home),
              ),
              accountName: Text('Naruto'),
              accountEmail: Text('naruto@hokage.com.jp'),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
                onTap: () {
                  Navigator.of(context).pushNamed('/Home');
                }),
            ListTile(
                leading: Icon(Icons.add),
                title: Text('Adicionar Pet'),
                onTap: () {
                  Navigator.of(context).pushNamed('/CadastroAnimal');
                }),
            ListTile(
                leading: Icon(Icons.map),
                title: Text('Mapa de lojas'),
                onTap: () {
                  Navigator.of(context).pushNamed('/Mapa');
                })
          ],
        )));
  }
}
