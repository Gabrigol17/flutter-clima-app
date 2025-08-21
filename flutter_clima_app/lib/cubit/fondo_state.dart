part of 'fondo_cubit.dart';

sealed class FondoState extends Equatable {
  const FondoState();

  @override
  List<Object> get props => [];
}

final class FondoInitial extends FondoState {}
