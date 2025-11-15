import 'dart:convert';
import 'package:anime_guide/providers/configuration_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:anime_guide/models/question.dart';

class ValorizacionPage extends StatefulWidget {
  const ValorizacionPage({super.key});
  @override
  State<ValorizacionPage> createState() => _ValorizacionPageState();
}

class _ValorizacionPageState extends State<ValorizacionPage> {
  Map<String, List<Question>> sections = {};
  final TextEditingController _idController = TextEditingController();
  final Map<String, List<TextEditingController>> _recControllers = {};

  bool loading = true;

  static const String developerEmail = 'dilara23@alumnos.utalca.cl';

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _loadSavedId();
  }

  Future<void> _loadSavedId() async {
    _idController.text = context.read<ConfigurationData>().getUsername;
  }

  Future<void> _loadQuestions() async {
    try {
      final raw = await rootBundle.loadString('assets/json/question.json');
      final Map<String, dynamic> data = json.decode(raw);

      final Map<String, List<Question>> parsed = {};
      data.forEach((key, value) {
        final list = (value as List)
            .map((e) => Question.fromMap(e as Map<String, dynamic>))
            .toList();
        parsed[key] = list;
        parsed.forEach((key, list) {
          _recControllers[key] = List.generate(
            list.length,
            (i) => TextEditingController(text: list[i].recomendacion),
          );
        });
      });

      setState(() {
        sections = parsed;
        loading = false;
      });
    } catch (e) {
      setState(() {
        sections = {};
        loading = false;
      });
    }
  }

  Future<void> _sendFeedback() async {
    final userId = _idController.text.trim();

    final buffer = StringBuffer();
    buffer.writeln('Aplicación: Anime Guide');
    buffer.writeln('Usuario: ${userId.isEmpty ? "Sin identificar" : userId}');
    buffer.writeln('Fecha: ${DateTime.now()}');
    buffer.writeln('');
    sections.forEach((sectionName, questions) {
      buffer.writeln('--- ${sectionName.toUpperCase()} ---');
      for (var q in questions) {
        buffer.writeln(q.titulo);
        buffer.writeln('Valor: ${q.valor}');
        buffer.writeln(
          'Rec../Com../Porque: ${q.recomendacion.isEmpty ? "N/A" : q.recomendacion}',
        );
        buffer.writeln('');
      }
    });

    final subject = 'Feedback Anime Guide';
    final body = buffer.toString();

    final uri = Uri(
      scheme: 'mailto',
      path: developerEmail,
      query: 'subject=$subject&body=$body',
    );

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No se pudo abrir el cliente de correo.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        appBar: AppBar(title: Text('Valorizacion')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Valorizacion')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(
                labelText: 'Identificacion / Nombre de usuario',
                border: OutlineInputBorder(),
                hintText: 'Escribe tu identificacion',
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (v) => v.trim(),
            ),
            const SizedBox(height: 12),
            // Lista de secciones y preguntas
            Expanded(
              child: sections.isEmpty
                  ? const Center(child: Text('No hay preguntas cargadas'))
                  : ListView.builder(
                      itemCount: sections.keys.length,
                      itemBuilder: (context, sectionIndex) {
                        final sectionKey = sections.keys.elementAt(
                          sectionIndex,
                        );
                        final questions = sections[sectionKey]!;
                        return _buildSection(sectionKey, questions);
                      },
                    ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('Enviar valoracion por correo'),
                onPressed: _sendFeedback,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Question> questions) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title[0].toUpperCase() + title.substring(1),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...questions.asMap().entries.map((entry) {
              final q = entry.value;
              final controller = _recControllers[title]![entry.key];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(q.titulo, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: Slider(
                            value: q.valor.toDouble(),
                            min: 0,
                            max: 5,
                            divisions: 5,
                            label: '${q.valor}',
                            onChanged: (v) {
                              setState(() {
                                q.valor = v.round();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              '${q.valor}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: controller,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        labelText: 'Recomendación / Comentario / Por que',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                      onChanged: (v) {
                        q.recomendacion = v;
                      },
                    ),
                    const SizedBox(height: 4),
                    Text('0: ${q.min}', style: const TextStyle(fontSize: 12)),
                    Text('5: ${q.max}', style: const TextStyle(fontSize: 12)),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _idController.dispose();
    for (final list in _recControllers.values) {
      for (final c in list) {
        c.dispose();
      }
    }
    super.dispose();
  }
}
