import 'package:denuncia_v1/config/colors.dart';
import 'package:denuncia_v1/providers/authmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildEmail() {
  late String email;
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingresa tu correo electrónico';
      }
      return null;
    },
    onSaved: (String? value) {
      email = value!; // Aquí puedes guardar el valor del correo electrónico
    },
  );
}

Widget buildPassword() {
  late String password;
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Correo Electrónico',
      border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingresa tu contraseña';
      }
      return null;
    },
    onSaved: (String? value) {
      password = value!; // Aquí puedes guardar el valor del correo electrónico
    },
  );
}

Widget formulario(BuildContext context, bool tecladoAbierto) {
  final auth = Provider.of<Authmodel>(context);
  final TextEditingController controller = TextEditingController();

  return Form(
    child: Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: !auth.isEmailStage,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return auth.isEmailStage
                  ? 'Por favor ingresa tu correo electrónico'
                  : 'Por favor ingresa tu contraseña';
            }
            return null;
          },
        ),
        SizedBox(height: tecladoAbierto ? 20 : 50),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.lightBlue,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            final input = controller.text.trim();
            if (input.isEmpty) return;

            if (auth.isEmailStage) {
              auth.setEmail(input);
              auth.goToPasswordStage();
            } else {
              auth.setPassword(input);
              // Aquí haces la lógica de login con email y password
              print('Email: ${auth.userEmail}');
              print('Password: ${auth.password}');
            }

            controller.clear();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.email, size: 24),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Text(
                  auth.isEmailStage ? 'Continuar con Correo' : 'Iniciar sesión',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool tecladoAbierto = MediaQuery.of(context).viewInsets.bottom > 0;
    return Consumer<Authmodel>(
      builder: (context, authmodel, child) {
        return Scaffold(
          body: Stack(
            children: [
              // Fondo azul (mitad superior)
              Container(
                height: tecladoAbierto ? size.height * 0.3 : size.height * 0.5,
                width: double.infinity,
                color: AppColors.darkBlue,
                alignment: Alignment.center,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/DenuncIA_logo.png',
                        width: size.width * 0.4,
                        height:
                            tecladoAbierto
                                ? size.height * 0.10
                                : size.height * 0.15,
                      ),
                    ),
                    Text(
                      'D e n u n c I A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),

              // Parte blanca encima con borde curvo
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height:
                      tecladoAbierto ? size.height * 0.38 : size.height * 0.55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          if (!authmodel.isEmailStage) {
                            authmodel
                                .goToEmailStage(); // vuelve al paso del correo
                          } else {
                            Navigator.pop(
                              context,
                            ); // sale de la pantalla si está en el paso de correo
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Continuar con Correo',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '¡Regístrate o inicia sesión con tu correo!',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.lightText,
                          ),
                        ),
                      ),
                      SizedBox(height: tecladoAbierto ? 20 : 60),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          authmodel.isEmailStage
                              ? 'Correo electrónico'
                              : 'Contraseña',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.lightText,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: formulario(context, tecladoAbierto),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: tecladoAbierto ? size.height * 0.163 : size.height * 0.36,
                right: 16,
                child: Image.asset('assets/Robot.png', width: 121),
              ),
            ],
          ),
        );
      },
    );
  }
}
