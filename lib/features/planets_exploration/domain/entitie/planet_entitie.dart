import 'package:equatable/equatable.dart';

class PlanetEntity extends Equatable {
  final String name;
  final String pngImage;
  final String glbModel;
  final String title;
  final String about;
  final String distanceFromSun;
  final String lengthOfDay;
  final String orbitalPeriod;
  final String radius;
  final String mass;
  final String gravity;
  final String surfaceArea;

  const PlanetEntity({
    required this.name,
    required this.pngImage,
    required this.glbModel,
    required this.title,
    required this.about,
    required this.distanceFromSun,
    required this.lengthOfDay,
    required this.orbitalPeriod,
    required this.radius,
    required this.mass,
    required this.gravity,
    required this.surfaceArea,
  });

  @override
  List<Object?> get props => [
    name,
    pngImage,
    glbModel,
    title,
    about,
    distanceFromSun,
    lengthOfDay,
    orbitalPeriod,
    radius,
    mass,
    gravity,
    surfaceArea,
  ];
}
