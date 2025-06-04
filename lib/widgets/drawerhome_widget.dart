import 'package:denuncia_v1/config/colors.dart';
import 'package:denuncia_v1/providers/authmodel.dart';
import 'package:denuncia_v1/widgets/draweritem_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(37, 43, 54, 1),
      width: MediaQuery.of(context).size.width * 0.80,
      child: Column(
        children: [
          Container(
            color: AppColors.darkBlue,
            height: MediaQuery.of(context).size.height * 0.30,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/DenuncIA_logo.png', width: 80),
                  Text(
                    'D  e  n  u  n  c  I  A',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          drawerItem(Icons.home_outlined, 'Inicio'),
          drawerItem(Icons.info_outline, 'Sobre nosotros'),
          drawerItem(Icons.notifications_outlined, 'Notificaciones'),
          drawerItem(Icons.contact_phone_outlined, 'Contáctate'),
          drawerItem(Icons.comment_outlined, 'Preguntas frecuentes'),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListTile(
              tileColor: AppColors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Row(
                children: [
                  Icon(Icons.logout, size: 30, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    'Cerrar sesión',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'loginScreen');
                Authmodel authmodel = Authmodel();
                authmodel.reset();
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
