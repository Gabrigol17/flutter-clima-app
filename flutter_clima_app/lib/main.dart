import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clima_app/Ventanas/inicio.dart';
import 'package:flutter_clima_app/bloc/clima_bloc.dart';
import 'package:flutter_clima_app/cubit/fondo_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ClimaBloc()),
        BlocProvider(create: (_) => FondoCubit()),
      ],
      child: MaterialApp(
        home: ClimaApp(),
      ),
    ),
  );
}
