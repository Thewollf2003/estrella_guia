import 'package:flutter/material.dart';
import 'package:estrella_guia/core/app_colors.dart';
import 'package:estrella_guia/core/app_texts.dart';

/// Widget que presenta la reflexión diaria.
/// Diseñado con una jerarquía visual clara: Icono -> Título -> Mensaje.
class ReflectionCard extends StatelessWidget {
  final String message;

  const ReflectionCard({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Detectamos el brillo para ajustar sombras y contrastes
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Container(
        // Limitamos el ancho para que no se vea demasiado estirado en tablets
        constraints: const BoxConstraints(maxWidth: 400),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          elevation: 8,
          shadowColor: AppColors.primary.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            // Añadimos un borde sutil dorado para dar elegancia "Navideña"
            side: BorderSide(
              color: AppColors.accent.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // La tarjeta se ajusta al contenido
              children: [
                // BLOQUE 1: Icono decorativo (La "Estrella Guía")
                const Icon(
                  Icons.auto_awesome,
                  color: AppColors.accent,
                  size: 40,
                ),
                const SizedBox(height: 16),

                // BLOQUE 2: Título de sección
                Text(
                  AppTexts.dailyPrompt,
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.accent : AppColors.secondary,
                  ),
                ),
                const SizedBox(height: 12),

                // BLOQUE 3: Cuerpo del mensaje
                // Usamos un Divider pequeño para separar el título del texto
                Container(
                  width: 40,
                  height: 2,
                  color: AppColors.primary.withOpacity(0.3),
                ),
                const SizedBox(height: 20),

                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6, // Mayor interlineado para lectura cómoda
                    fontStyle: FontStyle.italic,
                    color: isDark ? AppColors.textDark : AppColors.textLight,
                    fontFamily:
                        'Georgia', // O una fuente similar si está disponible
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
