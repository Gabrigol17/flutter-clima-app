import "package:geolocator/geolocator.dart";

Future<Position> ObtenerUbicacionActual() async{
  // Verificar que el servicio de gps del usuario este activo
  bool servicioActivo = await Geolocator.isLocationServiceEnabled();
  if (servicioActivo == false){
    throw Exception("El servicio de GPS no esta activo");
  }

  // Checkear permiso
  LocationPermission permiso = await Geolocator.checkPermission();

    if (permiso == LocationPermission.denied) {
    // Si el usuario ha rechazado el permiso, solicitarlo nuevamente
    permiso = await Geolocator.requestPermission();
    if (permiso == LocationPermission.denied) {
      throw Exception("Permiso de ubicación denegado. No podemos acceder a su ubicación.");
    }
  } else if (permiso == LocationPermission.deniedForever) {
    // Si el permiso fue denegado permanentemente
    throw Exception("El permiso de ubicación fue denegado permanentemente. No podemos acceder a su ubicación.");
  }
// Obtener ubicacion del Usuario
Position posicion = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
return posicion;
}