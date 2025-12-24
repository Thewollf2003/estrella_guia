```markdown
# 🌟 EstrellaGuía - Calendario de Reflexión Familiar

**EstrellaGuía** es una aplicación móvil desarrollada con **Flutter** diseñada para inspirar gratitud y fortalecer la unión familiar. La app ofrece un viaje visual y espiritual a través de un calendario festivo que abarca desde diciembre de 2025 hasta enero de 2027, proporcionando reflexiones diarias impulsadas por Inteligencia Artificial.

---

## ✨ Características Principales

- 📅 **Calendario Extendido:** Gestión de fechas desde diciembre de 2025 hasta enero de 2027.
- 🎄 **Celebraciones Automáticas:** Mensajes especiales de "¡Feliz Navidad!" y "¡Feliz Año Nuevo!" en las fechas correspondientes.
- 💡 **Reflexiones con IA:** Integración con la API de OpenRouter para generar mensajes diarios sobre la importancia de la familia y vivir plenamente.
- 🌓 **Personalización de Interfaz:** Soporte para Modo Claro y Modo Oscuro con una paleta de colores navideña (Rojo, Verde y Dorado).
- ⚙️ **Panel de Ajustes:** Control centralizado para el tema visual e información del proyecto.

---

## 🛠️ Tecnologías Utilizadas

- **Framework:** [Flutter](https://flutter.dev/) (v3.10+)
- **Lenguaje:** [Dart](https://dart.dev/)
- **Gestión de Estado:** [Provider](https://pub.dev/packages/provider)
- **Calendario:** [TableCalendar](https://pub.dev/packages/table_calendar)
- **Internacionalización:** [Intl](https://pub.dev/packages/intl)
- **Seguridad:** [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)

---

## 🚀 Instalación y Configuración

Sigue estos pasos para clonar y ejecutar el proyecto en tu máquina local:

### 1. Clonar el Repositorio
```bash
git clone [https://github.com/Thewollf2003/estrella_guia.git](https://github.com/Thewollf2003/estrella_guia.git)
cd estrella_guia

```

### 2. Configurar Variables de Entorno (IMPORTANTE)

Por seguridad, las llaves de API no se suben al repositorio. Debes crear el archivo manualmente:

1. Crea un archivo llamado `.env` en la raíz del proyecto (al mismo nivel que `pubspec.yaml`).
2. Agrega tu API Key de OpenRouter dentro del archivo:
```env
OPENROUTER_API_KEY=tu_clave_secreta_aqui

```



### 3. Instalar Dependencias

```bash
flutter pub get

```

### 4. Ejecutar la Aplicación

```bash
flutter run

```

---

## 📂 Estructura del Proyecto

El proyecto sigue una arquitectura organizada para facilitar el mantenimiento y la escalabilidad:

```text
lib/
├── core/       # Colores (AppColors) y Textos (AppTexts) globales.
├── data/       # Modelos de datos para las reflexiones.
├── providers/  # Lógica de cambio de tema (ThemeProvider).
├── services/   # Servicio de conexión con IA (AIReflectionService).
├── ui/         # Pantallas (Screens) y componentes visuales (Widgets).
└── main.dart   # Punto de entrada y configuración de la App.

```

---

## 🛡️ Seguridad

Este proyecto utiliza un archivo `.gitignore` para prevenir la exposición de credenciales sensibles. Si planeas desplegar esta aplicación, asegúrate de gestionar tus llaves de API mediante secretos de entorno.

---

## 👤 Autor

Desarrollado por **Thewollf2003** - GitHub: [@Thewollf2003](https://github.com/Thewollf2003)

* Proyecto: [EstrellaGuía](https://www.google.com/url?sa=E&source=gmail&q=https://github.com/Thewollf2003/estrella_guia)

---

*Desarrollado con ❤️ para iluminar cada día del año.*

```

---

### 📢 Bonus: Texto para tu LinkedIn
Si quieres compartir tu logro, puedes usar este texto:

> **¡Nuevo Proyecto Finalizado! 🚀🌟**
> 
> Acabo de publicar en GitHub **EstrellaGuía**, una aplicación móvil desarrollada con **Flutter** que combina el espíritu navideño con la potencia de la **Inteligencia Artificial**.
> 
> 📅 Calendario interactivo (2025-2027).
> 💡 Reflexiones diarias sobre la familia generadas por IA.
> 🎨 Diseño adaptable (Modo oscuro/claro) con estética festiva.
> 
> Pueden ver el código y la arquitectura del proyecto aquí: [https://github.com/Thewollf2003/estrella_guia](https://github.com/Thewollf2003/estrella_guia)
> 
> #Flutter #Dart #MobileDevelopment #OpenRouter #AI #GitHub #Programacion
```
