import "dart:convert";
import "package:flutter_clima_app/API/modeloApi.dart";
import "package:http/http.dart" as http;

class ServicioApi {

  // Clave api 
  final String apiKey = "6e39a531eec948a6af125350252108"; 

    Future<ModeloClima> cargarClima(double lat, double lon) async {
      // Creamos la URL con la latitud y longitud obtenida por geolocalizacion
      final url = "https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$lat,$lon";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ModeloClima.fromJson(data);
      } else {
        throw Exception("Error al cargar el clima");
      }
    }
}