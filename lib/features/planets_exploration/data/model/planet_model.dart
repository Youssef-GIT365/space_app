import 'package:space_app/features/planets_exploration/domain/entitie/planet_entitie.dart';

class PlanetModel extends PlanetEntity {
  const PlanetModel({
    required super.name,
    required super.pngImage,
    required super.glbModel,
    required super.title,
    required super.about,
    required super.distanceFromSun,
    required super.lengthOfDay,
    required super.orbitalPeriod,
    required super.radius,
    required super.mass,
    required super.gravity,
    required super.surfaceArea,
  });
  factory PlanetModel.fromJson(Map<String, dynamic> json) {
    return PlanetModel(
      name: json['planet_name'] ?? '',
      pngImage: json['png_image'] ?? '',
      glbModel: json['3d_model'] ?? '',
      title: json['title'] ?? '',
      about: json['about'] ?? '',
      distanceFromSun: json['distance_from_sun'] ?? '',
      lengthOfDay: json['length_of_day'] ?? '',
      orbitalPeriod: json['orbital_period'] ?? '',
      radius: json['radius'] ?? '',
      mass: json['mass'] ?? '',
      gravity: json['gravity'] ?? '',
      surfaceArea: json['surface_area'] ?? '',
    );
  }
}
