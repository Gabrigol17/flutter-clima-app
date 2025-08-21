import 'package:flutter/material.dart';
import 'package:flutter_clima_app/API/geolocator.dart';
import 'package:flutter_clima_app/API/peticionApi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherTestPage(),
    );
  }
}

class WeatherTestPage extends StatelessWidget {
  final servicio = ServicioApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prueba Clima")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final posicion = await ObtenerUbicacionActual();
              final clima = await servicio.cargarClima(
                posicion.latitude,
                posicion.longitude,
              );

              print("Ciudad: ${clima.nombreCiudad}");
              print("Temperatura: ${clima.temperatura}");
              print("Condición: ${clima.condicion}");

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "Ciudad: ${clima.nombreCiudad}, Temp: ${clima.temperatura}°C"),
                ),
              );
            } catch (e) {
              print("Error: $e");
            }
          },
          child: Text("Obtener Clima"),
        ),
      ),
    );
  }
}
