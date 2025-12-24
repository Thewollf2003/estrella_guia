# estrella_guia

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

lib/
├── core/
│   ├── app_colors.dart
│   └── app_texts.dart
├── data/
│   └── reflection_model.dart          # Modelo básico (opcional, usado para tipo)
├── providers/
│   └── theme_provider.dart            # Gestiona modo claro/oscuro
├── services/
│   └── ai_reflection_service.dart     # Llama a IA o usa fallback
├── ui/
│   ├── screens/
│   │   └── home_calendar.dart         # Pantalla principal con calendario y reflexión
│   └── widgets/
│       └── reflection_card.dart       # Tarjeta visual de la reflexión
└── main.dart                          # Punto de entrada con provider y navigator