// lib/features/planets_exploration/data/repositories/planets_repository_impl.dart
import 'package:space_app/features/planets_exploration/data/dataSource/planets_local_data_source.dart';
import 'package:space_app/features/planets_exploration/domain/entitie/planet_entitie.dart';
import 'package:space_app/features/planets_exploration/domain/repo/planets_repository.dart';

class PlanetsRepositoryImpl implements PlanetsRepository {
  final PlanetsLocalDataSource localDataSource;

  PlanetsRepositoryImpl({required this.localDataSource});

  @override
  Future<List<PlanetEntity>> getPlanets() async {
    try {
      final localPlanets = await localDataSource.getPlanetsFromSheet();
      return localPlanets;
    } catch (e) {
      throw Exception('Error in PlanetsRepository: $e');
    }
  }
}
