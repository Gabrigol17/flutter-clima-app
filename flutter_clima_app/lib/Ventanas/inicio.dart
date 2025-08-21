import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clima_app/API/geolocator.dart';
import 'package:flutter_clima_app/cubit/fondo_cubit.dart';
import '../bloc/clima_bloc.dart';

class ClimaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,title: Text(
        "☁️ App del Clima", style: TextStyle(color: Colors.white)), 
        centerTitle: true),

      body: BlocBuilder<FondoCubit, FondoState>(
        builder: (context, fondoState) {
          Color fondo;

          if (fondoState is FondoFrio) {
            fondo = Colors.blue;
          } else if (fondoState is FondoCalido) {
            fondo = Colors.orange;
          } else {
            fondo = Colors.white; // El estado inicial va a ser blanco
          }

          return Container(
            color: fondo,
            child: BlocBuilder<ClimaBloc, ClimaState>(
              builder: (context, state) {
                if (state is ClimaInitial) {
                  return Center(child: Text("Presiona el botón para ver el clima"));
                } 
                else if (state is ClimaLoading) {
                  return Center(child: CircularProgressIndicator());
                } 
                else if (state is ClimaLoaded) {
                  context.read<FondoCubit>().actualizarTema(state.clima.temperatura);
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ciudad: ${state.clima.nombreCiudad}", style: TextStyle(fontSize: 20)),
                        Text("Temperatura: ${state.clima.temperatura}°C", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  );
                } 
                else if (state is ClimaError) {
                  return Center(child: Text(state.mensaje));
                } 
                else {
                  return SizedBox(); // caso por defecto solo pone espacio y ya
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cloud),
        onPressed: () async {
          try {
            final posicion = await ObtenerUbicacionActual();
            context.read<ClimaBloc>().add(
              CargarClima(posicion.latitude, posicion.longitude),
            );
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
