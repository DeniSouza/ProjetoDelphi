import 'package:flutter/material.dart';

class CadastroUser extends StatefulWidget {
  const CadastroUser({Key? key}) : super(key: key);

  @override
  _CadastroUserState createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  String nome = '';
  String email = '';
  String senha = '';
  int idade = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            nome = text;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: 'Nome', border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          onChanged: (text) {
                            email = text;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email', border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          onChanged: (text) {
                            senha = text;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'Senha', border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          onChanged: (text) {
                            senha = text;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'Confirme sua Senha',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/Home');
                          },
                          child: Text('Cadastrar'),
                        )
                      ],
                    )))));
  }
}
