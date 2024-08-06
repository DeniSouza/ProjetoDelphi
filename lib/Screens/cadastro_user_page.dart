import 'package:flutter/material.dart';
import 'package:projeto_delphi/Utils/utils.dart';
import 'package:provider/provider.dart';

class CadastroUser extends StatefulWidget {
  const CadastroUser({Key? key}) : super(key: key);

  @override
  _CadastroUserState createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final confirmasenha = TextEditingController();
  final nome = TextEditingController();
  final idade = TextEditingController();

  registrar() async {
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
  }

  registraUsuario() async {
    try {
      await context
          .read<RegistroUsuario>()
          .registraUsuario(nome.text, idade.text, email.text);
    } on ExcecaoRegistroUsuario catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        const Text.rich(TextSpan(
                          text: "D E L P H I",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        const SizedBox(height: 10),
                        TextField(
                          controller: nome,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              labelText: 'Nome', border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: idade,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Idade', border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              labelText: 'Email', border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          controller: senha,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              labelText: 'Senha', border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          controller: confirmasenha,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              labelText: 'Confirme sua senha',
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () async {
                            await registrar();
                            if (context.read<AuthService>().usuario != null) {
                              await registraUsuario();
                              await Navigator.pushReplacementNamed(
                                  context, '/Home');
                            }
                          },
                          child: const Text('Cadastrar'),
                        )
                      ],
                    )))));
  }
}
