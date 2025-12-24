import 'package:flutter/material.dart';

/// Clase central de diseño.
/// Define la identidad de "EstrellaGuía" basada en una paleta tradicional navideña.
class AppColors {
  // --- COLORES DE MARCA ---
  static const Color primary = Color(
    0xFFC1272D,
  ); // Rojo Navidad (Pasión y calidez)
  static const Color secondary = Color(
    0xFF007A33,
  ); // Verde Bosque (Naturaleza y vida)
  static const Color accent = Color(0xFFFFD700); // Dorado (Luz y guía)

  // --- COLORES DE INTERFAZ ---

  // Fondo para el modo claro
  static const Color backgroundLight = Colors.white;
  // Fondo para el modo oscuro (Gris casi negro para mejor contraste)
  static const Color backgroundDark = Color(0xFF121212);

  // Colores de texto para legibilidad
  static const Color textLight = Color(0xFF2D2D2D);
  static const Color textDark = Color(0xFFE0E0E0);

  // Color decorativo para las tarjetas
  static const Color cardShadow = Color(0x29000000);
}
