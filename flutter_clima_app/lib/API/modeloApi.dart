
class ModeloClima {
  final String nombreCiudad;
  final double temperatura;
  final String condicion;

  ModeloClima({
    required this.nombreCiudad,
    required this.temperatura,
    required this.condicion,
  });

  //Metodo constructor para crear JSON: Factory
  factory ModeloClima.fromJson(Map<String, dynamic> json) {
    return ModeloClima(
      nombreCiudad: json['location']['name'],
      temperatura: json['current']['temp_c'].toDouble(),
      condicion: json['current']['condition']['text'],
    );
  }
}