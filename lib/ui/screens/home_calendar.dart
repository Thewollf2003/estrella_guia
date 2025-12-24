import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

// Importaciones de tu proyecto
import 'package:estrella_guia/core/app_colors.dart';
import 'package:estrella_guia/core/app_texts.dart';
import 'package:estrella_guia/providers/theme_provider.dart';
import 'package:estrella_guia/services/ai_reflection_service.dart';
import 'package:estrella_guia/ui/widgets/reflection_card.dart';

class HomeCalendarScreen extends StatefulWidget {
  const HomeCalendarScreen({Key? key}) : super(key: key);

  @override
  State<HomeCalendarScreen> createState() => _HomeCalendarScreenState();
}

class _HomeCalendarScreenState extends State<HomeCalendarScreen> {
  // BLOQUE 1: Variables de Estado
  late DateTime _selectedDate;
  late DateTime _focusedDay;
  String _currentReflection = "Cargando reflexión familiar...";
  bool _isLoading = true;

  // Rango definido en tus objetivos
  final DateTime _firstDayRange = DateTime(2025, 12, 1);
  final DateTime _lastDayRange = DateTime(2027, 1, 31);

  @override
  void initState() {
    super.initState();
    _initializeDates();
    _loadReflection(_selectedDate);
  }

  // BLOQUE 2: Lógica de Inicialización Segura
  void _initializeDates() {
    final now = DateTime.now();
    // Si la fecha actual está fuera del rango del calendario,
    // forzamos que inicie en el primer día permitido (Dic 2025).
    if (now.isBefore(_firstDayRange) || now.isAfter(_lastDayRange)) {
      _selectedDate = _firstDayRange;
      _focusedDay = _firstDayRange;
    } else {
      _selectedDate = now;
      _focusedDay = now;
    }
  }

  // BLOQUE 3: Carga de Datos (IA o Fallback)
  Future<void> _loadReflection(DateTime date) async {
    if (!mounted) return;
    setState(() => _isLoading = true);

    // Llamada al servicio que creamos (con manejo de errores interno)
    final reflection = await AIReflectionService.getDailyReflectionFromAI(date);

    if (mounted) {
      setState(() {
        _currentReflection = reflection;
        _isLoading = false;
      });
    }
  }

  // BLOQUE 4: Panel de Configuración (BottomSheet)
  void _showSettings(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppTexts.settingsTitle,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            SwitchListTile.adaptive(
              title: const Text('Modo Oscuro Navideño'),
              secondary: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
              value: themeProvider.isDarkMode,
              onChanged: (value) => themeProvider.toggleTheme(),
            ),
            const SizedBox(height: 10),
            Text(
              AppTexts.aboutDescription,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver al Calendario'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Verificación de festividades para el banner decorativo
    final isChristmas = _selectedDate.month == 12 && _selectedDate.day == 25;
    final isNewYear = _selectedDate.month == 1 && _selectedDate.day == 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTexts.appTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.auto_awesome),
            onPressed: () => _showSettings(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner Festivo Condicional
          if (isChristmas || isNewYear)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: Colors.amber[700],
              child: Text(
                isChristmas ? '🎄 ¡Feliz Navidad! 🎄' : '✨ ¡Feliz Año Nuevo! ✨',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

          // BLOQUE 5: Widget de Calendario
          TableCalendar(
            locale:
                'es_ES', // Usamos la localización que activamos en main.dart
            firstDay: _firstDayRange,
            lastDay: _lastDayRange,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
            calendarFormat: CalendarFormat.month,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDate = selectedDay;
                _focusedDay = focusedDay;
              });
              _loadReflection(selectedDay);
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              selectedDecoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // BLOQUE 6: Área de Reflexión
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                  : SingleChildScrollView(
                      child: ReflectionCard(message: _currentReflection),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
