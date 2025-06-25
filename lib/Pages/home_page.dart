import 'package:denuncia_v1/providers/tabindex.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(
            'Tu seguridad digital empieza aquí. Aprende, protégete y denuncia con confianza.',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Center(child: Image.asset('assets/image_home.png', height: 150)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Explora nuestros módulos educativos, habla con nuestro asistente virtual o reporta un incidente en segundos.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            color: Color.fromRGBO(37, 43, 54, 0.7),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '¿Fuiste víctima?',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              'Si fuiste víctima de robo de tarjeta de crédito, cámbio de contraseñas, víctima de phishing, entre otros., atrévete a denunciar. ¡NO TENGAS MIEDO!',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/image_victima.png', height: 150),
                    ],
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'chatbotScreen');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white, // Fondo blanco
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Esquinas redondeadas
                      ),
                    ),
                    child: Text(
                      'Denunciar ahora',
                      style: TextStyle(color: Colors.black), // Texto negro
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200, // o el tamaño que necesites
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/hacker_background.png',
                ), // ruta de tu imagen
                fit: BoxFit.cover,
                opacity: 0.4, // para que la imagen cubra todo el container
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¡Tienes que saber algo!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Infórmate sobre qué tipos de delitos cibernéticos están transcurriendo actualmente por el mundo y por el Perú, y cómo saber prevenirlos...',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    final tabIndexProvider = Provider.of<TabIndexProvider>(
                      context,
                      listen: false,
                    );
                    tabIndexProvider.setIndex(1);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white, // Fondo blanco
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // Esquinas redondeadas
                    ),
                  ),
                  child: Text(
                    'Informate aquí',
                    style: TextStyle(color: Colors.black), // Texto negro
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
