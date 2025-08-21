import "dart:convert";
import "package:http/http.dart" as http;

class ServicioApi {

  // Clave api 
  final String apiKey = "6e39a531eec948a6af125350252108"; 

    Future<Map<String, dynamic>> cargarclima(String ciudad) async {
      // Insertamos la clave api en la url que se va a parsear
      final response = await http.get(Uri.parse("https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$ciudad"));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Error al cargar el clima");
      }
    }
}