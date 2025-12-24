import 'package:estrella_guia/data/reflection_model.dart';

final List<String> _dailyReflections = [
  "La familia es el regalo que dura todo el año.",
  "Vive hoy como si fuera el último suspiro de una estrella.",
  "El tiempo con tus seres queridos es la mejor inversión.",
  "No esperes a mañana para decir 'te quiero'.",
  "Agradece lo simple, porque en lo simple vive la magia.",
  "Una sonrisa compartida es la estrella más brillante del hogar.",
  "Hoy es un buen día para perdonar, abrazar y empezar de nuevo.",
  "No midas el amor en regalos, sino en presencia.",
];

String getDailyReflection(DateTime date) {
  // Evita índice negativo en caso de error
  final dayOfYear = date.difference(DateTime(date.year, 1, 1)).inDays;
  final index = (dayOfYear.abs() % _dailyReflections.length);
  return _dailyReflections[index];
}
