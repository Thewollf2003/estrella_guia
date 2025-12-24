// lib/providers/theme_provider.dart
import 'package:flutter/foundation.dart';

/// Proveedor de estado para el modo de tema (claro/oscuro).
/// Usa el patrón de ChangeNotifier para notificar cambios a la UI.
class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  /// Devuelve el estado actual del tema.
  bool get isDarkMode => _isDarkMode;

  /// Alterna entre modo claro y oscuro y notifica a los widgets escuchando.
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Importante: sin esto, la UI no se actualiza
  }
}
