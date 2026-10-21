import 'package:space_app/features/planets_exploration/domain/entitie/planet_entitie.dart';
import 'package:space_app/features/planets_exploration/domain/repo/planets_repository.dart';

class GetPlanetsUseCase {
  final PlanetsRepository repository;

  GetPlanetsUseCase({required this.repository});
  Future<List<PlanetEntity>> call() async {
    return await repository.getPlanets();
  }
}
