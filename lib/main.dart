import 'package:denuncia_v1/firebase_options.dart';
import 'package:denuncia_v1/providers/authmodel.dart';
import 'package:denuncia_v1/providers/tabindex.dart';
import 'package:denuncia_v1/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authmodel()),
        ChangeNotifierProvider(create: (_) => TabIndexProvider()),
      ],
      child: MaterialApp(
        title: 'DenuncIA App',
        initialRoute: AppRouting.initialRoute,
        debugShowCheckedModeBanner: false,
        routes: AppRouting.getRoutes(),
        theme: ThemeData(
          useMaterial3: true,
          tabBarTheme: TabBarTheme(dividerColor: Colors.transparent),
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
