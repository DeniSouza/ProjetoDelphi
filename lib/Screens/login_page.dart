import 'package:flutter/material.dart';
import 'package:projeto_delphi/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  login() async {
    // chamada do método de autenticação dentro do firebase e retornando caso o login tenha sido bem sucedido ou não.
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text.rich(TextSpan(
                      text: "D E L P H I",
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    const SizedBox(height: 50),
                    TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: senha,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Senha', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      //Início botão entrar
                      onPressed: () async {
                        await login();
                        if (context.read<AuthService>().usuario != null) {
                          //caso o login seja bem sucedido, ele prossegue para a tela de home.
                          Navigator.pushReplacementNamed(context, '/Home');
                        }
                      },
                      child: const Text('Entrar'), //Final botão entrar
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      // Início botão cadastrar
                      onPressed: () {
                        Navigator.of(context).pushNamed('/CadastroUser');
                      },
                      child:
                          const Text('Ainda não tem Cadastro? Cadastre aqui'),
                    ) // Início botão cadastrar
                  ],
                ))),
      ),
    );
  }
}
