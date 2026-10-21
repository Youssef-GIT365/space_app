
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/planets_exploration/domain/usecase/planet_usecase.dart';

import 'planets_state.dart';

class PlanetsCubit extends Cubit<PlanetsState> {
  final GetPlanetsUseCase getPlanetsUseCase;

  PlanetsCubit({required this.getPlanetsUseCase}) : super(PlanetsInitial());

  Future<void> fetchPlanets() async {
    emit(PlanetsLoading());
    try {
      final planets = await getPlanetsUseCase();
      emit(PlanetsSuccess(planets: planets));
    } catch (e) {
      emit(PlanetsError(errorMessage: e.toString()));
    }
  }

  void updateCurrentPlanetIndex(int index) {
    if (state is PlanetsSuccess) {
      final currentState = state as PlanetsSuccess;
      emit(currentState.copyWith(currentPlanetIndex: index));
    }
  }
}