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
            alignment: Alignment.center,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/DenuncIA_logo.png',
                    width: size.width * 0.4,
                    height: size.height * 0.15,
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
              height: size.height * 0.55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ),

          Positioned(
            top: size.height * 0.36,
            right: 16,
            child: Image.asset('assets/Robot.png', width: 121),
          ),
        ],
      ),
    );
  }
}
