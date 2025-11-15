class Question {
  final String titulo;
  final String min;
  final String max;
  int valor;
  String recomendacion;

  Question({
    required this.titulo,
    required this.min,
    required this.max,
    this.valor = 0,
    this.recomendacion = '',
  });

  factory Question.fromMap(Map<String, dynamic> m) => Question(
    titulo: m['titulo'] ?? '',
    min: m['min'] ?? '',
    max: m['max'] ?? '',
    valor: (m['valor'] as num?)?.toInt() ?? 0,
    recomendacion: m['recomendacion'] ?? '',
  );

  Map<String, dynamic> toMap() => {
    'titulo': titulo,
    'min': min,
    'max': max,
    'valor': valor,
    'recomendacion': recomendacion,
  };
}
