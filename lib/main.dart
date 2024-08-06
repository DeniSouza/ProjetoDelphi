import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_delphi/Utils/utils.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(
          create: (context) => RegistroUsuario(
            auth: context.read<AuthService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => RegistroAnimal(
            auth: context.read<AuthService>(),
          ),
        ),
      ],
      child: DevicePreview(
        enabled: false,
        builder: (context) => const AppWidget(), // Wrap your app,
      ),
    ),
  );
}
