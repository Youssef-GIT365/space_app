import 'package:equatable/equatable.dart';
import 'package:space_app/features/planets_exploration/domain/entitie/planet_entitie.dart';

abstract class PlanetsState extends Equatable {
  const PlanetsState();

  @override
  List<Object?> get props => [];
}

class PlanetsInitial extends PlanetsState {}

class PlanetsLoading extends PlanetsState {}

class PlanetsSuccess extends PlanetsState {
  final List<PlanetEntity> planets;
  final int currentPlanetIndex;
  const PlanetsSuccess({required this.planets, this.currentPlanetIndex = 0});

  PlanetsSuccess copyWith({
    List<PlanetEntity>? planets,
    int? currentPlanetIndex,
  }) {
    return PlanetsSuccess(
      planets: planets ?? this.planets,
      currentPlanetIndex: currentPlanetIndex ?? this.currentPlanetIndex,
    );
  }

  @override
  List<Object?> get props => [planets, currentPlanetIndex];
}

class PlanetsError extends PlanetsState {
  final String errorMessage;

  const PlanetsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
