import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clima_app/API/geolocator.dart';
import 'package:flutter_clima_app/API/peticionApi.dart';
import 'package:flutter_clima_app/Ventanas/inicio.dart';
import 'package:flutter_clima_app/bloc/clima_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ClimaBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ClimaApp(), // <-- tu widget principal
      ),
    ),
  );
}