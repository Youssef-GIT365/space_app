import 'package:space_app/features/planets_exploration/domain/entitie/planet_entitie.dart';

abstract class PlanetsRepository {
  Future<List<PlanetEntity>> getPlanets();
}
