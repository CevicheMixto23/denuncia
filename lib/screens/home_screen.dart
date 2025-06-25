import 'package:denuncia_v1/Pages/Test_page.dart';
import 'package:denuncia_v1/Pages/home_page.dart';
import 'package:denuncia_v1/Pages/informate_page.dart';
import 'package:denuncia_v1/Pages/noticia_page.dart';
import 'package:denuncia_v1/config/colors.dart';
import 'package:denuncia_v1/providers/tabindex.dart';
import 'package:denuncia_v1/widgets/drawerhome_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa provider

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    // Escucha los cambios del provider (solo para reconstruir si el índice cambia)
    final tabIndexProvider = Provider.of<TabIndexProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFF252B36), // Color de fondo de la pestaña
            ),
            child: TabBar(
              controller: _tabController, // Asigna tu TabController
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              // Puedes personalizar el indicador si no quieres la línea inferior default

              // Puedes usar un TabBarTheme global en tu ThemeData para esto,
              // o definirlo directamente aquí si solo aplica a este TabBar
              dividerColor:
                  Colors.transparent, // Asegúrate de que el divider esté oculto
              dividerHeight: 0.0,
              tabs: const [
                Tab(text: 'Inicio'),
                Tab(text: 'Infórmate'),
                Tab(text: 'Test'),
                Tab(text: 'Noticia'),
              ],
            ),
          ),
        ),
      ),
      drawer: const DrawerHome(),
      body: TabBarView(
        controller: _tabController, // Asigna tu TabController
        children: const [
          HomePage(),
          InformatePage(),
          TestPage(),
          NoticiaPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.darkBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home_outlined, color: Colors.white),
              iconSize: 40,
              onPressed: () {
                // Cambia el índice usando el provider
                Provider.of<TabIndexProvider>(
                  context,
                  listen: false,
                ).setIndex(0);
              },
            ),
            IconButton(
              icon: const Icon(Icons.search_outlined, color: Colors.white),
              iconSize: 40,
              onPressed: () {
                // Puedes navegar a una nueva pantalla o cambiar a otra pestaña
                // Por ejemplo, para ir a la segunda pestaña (Infórmate):
                Provider.of<TabIndexProvider>(
                  context,
                  listen: false,
                ).setIndex(1);
              },
            ),
            IconButton(
              icon: const Icon(Icons.person_outline, color: Colors.white),
              iconSize: 40,
              onPressed: () {
                // Para ir a la tercera pestaña (Test):
                Provider.of<TabIndexProvider>(
                  context,
                  listen: false,
                ).setIndex(2);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(46, 44, 44, 1.0),
        child: const Icon(Icons.support_agent, color: Colors.white, size: 30),
        onPressed: () {
          Navigator.pushNamed(context, '/crearDenuncia');
        },
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Escucha los cambios del provider y actualiza el TabController
    // Solo si el índice del provider es diferente al índice actual del TabController
    final tabIndexProvider = Provider.of<TabIndexProvider>(context);
    if (_tabController.index != tabIndexProvider.currentIndex) {
      _tabController.animateTo(tabIndexProvider.currentIndex);
    }
  }

  @override
  void dispose() {
    _tabController.dispose(); // ¡Importante liberar el TabController!
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Inicializa el TabController con la longitud de tus tabs
    _tabController = TabController(length: 4, vsync: this);

    // Añade un listener para cuando el usuario cambie de pestaña manualmente
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        // Solo actualiza el provider si el cambio fue por interacción del usuario
        // o si queremos que siempre refleje el estado del TabController
        Provider.of<TabIndexProvider>(
          context,
          listen: false,
        ).setIndex(_tabController.index);
      }
    });
  }
}
