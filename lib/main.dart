import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart'; // Importante para el calendario

// Importaciones de tus archivos internos
import 'package:estrella_guia/providers/theme_provider.dart';
import 'package:estrella_guia/ui/screens/home_calendar.dart';

Future<void> main() async {
  // BLOQUE 1: Inicialización de servicios básicos
  // Garantiza que los bindings de Flutter estén listos antes de usar await
  WidgetsFlutterBinding.ensureInitialized();

  // BLOQUE 2: Carga de variables de entorno con manejo de errores
  try {
    await dotenv.load(fileName: ".env");
    print("✅ EstrellaGuía: Configuración .env cargada.");
  } catch (e) {
    // Si falla, imprimimos el error pero permitimos que la app siga al fallback
    print(
      "⚠️ EstrellaGuía: No se pudo cargar .env, usando modo local. Error: $e",
    );
  }

  // BLOQUE 3: Inicialización de formatos de fecha
  // Necesario para que TableCalendar no falle al mostrar meses en español/local
  await initializeDateFormatting('es_ES', null);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const EstrellaGuiaApp(),
    ),
  );
}

class EstrellaGuiaApp extends StatelessWidget {
  const EstrellaGuiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Escucha los cambios del ThemeProvider para redibujar la app
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'EstrellaGuía',
      debugShowCheckedModeBanner: false,

      // BLOQUE 4: Configuración de Temas (Corrección de CardTheme)
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.red, // Genera paleta basada en rojo navideño
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        // CORRECCIÓN: Se usa CardTheme, no CardThemeData
        cardTheme: const CardThemeData(color: Colors.white, elevation: 2),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.red,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[900],
          foregroundColor: Colors.white,
        ),
        // CORRECCIÓN: Se usa CardTheme, no CardThemeData
        cardTheme: CardThemeData(color: Colors.grey[850], elevation: 2),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),

      // Control de modo (Claro/Oscuro)
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // Pantalla inicial
      home: const HomeCalendarScreen(),
    );
  }
}
