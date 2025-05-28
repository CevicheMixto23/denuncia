import 'package:denuncia_v1/config/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Fondo azul (mitad superior)
          Container(
            height: size.height * 0.5,
            width: double.infinity,
            color: AppColors.darkBlue,
          ),

          // Parte blanca encima con borde curvo
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
