import 'package:denuncia_v1/firebase_options.dart';
import 'package:denuncia_v1/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DenuncIA App',
      initialRoute: AppRouting.initialRoute,
      debugShowCheckedModeBanner: false,
      routes: AppRouting.getRoutes(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
