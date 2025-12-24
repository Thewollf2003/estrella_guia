// lib/services/ai_reflection_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIReflectionService {
  // Usa OpenRouter (gratis con registro) o Hugging Face
  // Aquí usamos OpenRouter por mejor calidad y modelos modernos
  static const String _openRouterUrl =
      'https://openrouter.ai/api/v1/chat/completions';
  // Regístrate en https://openrouter.ai/ para obtener tu API key
  static String get _apiKey => dotenv.env['OPENROUTER_API_KEY'] ?? '';

  static Future<String> getDailyReflectionFromAI(DateTime date) async {
    final prompt =
        '''
Eres un sabio navideño que escribe reflexiones cortas, cálidas y profundas sobre la familia, la gratitud y el amor.
Escribe exactamente UNA oración (máximo 120 caracteres) para el día ${date.day}/${date.month}/${date.year}.
Evita fechas específicas. Sé inspirador, poético y humano.
    ''';

    try {
      final response = await http.post(
        Uri.parse(_openRouterUrl),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
          'HTTP-Referer': 'https://github.com/thewolf/estrella-guia',
          'X-Title': 'EstrellaGuía',
        },
        body: jsonEncode({
          "model": "mistralai/mistral-7b-instruct:free", // gratis en OpenRouter
          "messages": [
            {"role": "user", "content": prompt},
          ],
          "max_tokens": 60,
          "temperature": 0.8,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['choices'][0]['message']['content'] as String;
        // Limpiar comillas, saltos de línea, etc.
        return content.trim().replaceAll(RegExp(r'^["“”]+|["“”]+$'), '');
      } else {
        throw Exception('API error: ${response.statusCode}');
      }
    } catch (e) {
      // Si falla, usar fallback local
      return _getLocalFallbackReflection(date);
    }
  }

  static String _getLocalFallbackReflection(DateTime date) {
    final messages = [
      "La familia es el regalo que dura todo el año.",
      "Hoy, abraza con el corazón, no solo con los brazos.",
      "La gratitud convierte lo que tenemos en suficiente.",
      "Una risa familiar es música celestial.",
      "El amor no se guarda para después; se vive hoy.",
    ];
    final index = date.day % messages.length;
    return messages[index];
  }
}
