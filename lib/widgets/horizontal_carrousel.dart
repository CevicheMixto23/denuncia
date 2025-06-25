import 'package:flutter/material.dart';

class HorizontalCarrousel extends StatefulWidget {
  const HorizontalCarrousel({super.key});

  @override
  State<HorizontalCarrousel> createState() => _HorizontalCarrouselState();
}

class _HorizontalCarrouselState extends State<HorizontalCarrousel> {
  int _currentIndex = 0;
  final List<Map<String, String>> items = [
    {'title': 'Denuncia por fraude electrónico'},
    {'title': 'Información sobre phishing'},
    {'title': 'Denuncia por robo de identidad'},
    {'title': 'Asesoría legal gratuita'},
    {'title': 'Recursos para víctimas de fraude'},
    {'title': 'Cómo proteger tu información personal'},
    {'title': 'Consejos de seguridad en línea'},
    {'title': 'Denuncia por acoso cibernético'},
    {'title': 'Información sobre estafas comunes'},
    {'title': 'Cómo reportar un fraude financiero'},
    // Puedes agregar más items aquí
  ];

  final PageController _pageController = PageController(
    viewportFraction: 0.48, // Ajusta para que se vean dos tarjetas
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    final double cardHeight = 60;
    return Center(
      child: Container(
        width: double.infinity,
        height: cardHeight + 32,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: cardHeight,
              child: PageView.builder(
                controller: _pageController,
                itemCount: items.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(180, 60),
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.white24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        items[i]['title']!,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Botón izquierdo
            Positioned(
              left: 0,
              child: SizedBox(
                height: cardHeight - 16,
                width: cardHeight - 16,
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: const Icon(Icons.chevron_left, color: Colors.white),
                    iconSize: cardHeight - 24,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (_currentIndex > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            // Botón derecho
            Positioned(
              right: 0,
              child: SizedBox(
                height: cardHeight - 16,
                width: cardHeight - 16,
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right, color: Colors.white),
                    iconSize: cardHeight - 24,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (_currentIndex < items.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
