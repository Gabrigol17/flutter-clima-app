import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clima_app/API/geolocator.dart';
import '../bloc/clima_bloc.dart';

class ClimaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clima App")),
      body: BlocBuilder<ClimaBloc, ClimaState>(
        builder: (context, state) {
          if (state is ClimaInitial) {
            return Center(child: Text("Presiona el botón para ver el clima"));
          } 
          else if (state is ClimaLoading) {
            return Center(child: CircularProgressIndicator());
          } 
          else if (state is ClimaLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ciudad: ${state.clima.nombreCiudad}"),
                  Text("Temperatura: ${state.clima.temperatura}°C"),
                ],
              ),
            );
          } 
          else if (state is ClimaError) {
            return Center(child: Text(state.mensaje));
          } 
          else {
            return SizedBox(); // caso por defecto
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cloud),
        onPressed: () async {
          try {
            // pedir ubicación actual
            final posicion = await ObtenerUbicacionActual();
            // disparar evento al bloc
            context.read<ClimaBloc>().add(CargarClima(posicion.latitude, posicion.longitude));
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: $e")),
            );
          }
        },
      ),
    );
  }
}
