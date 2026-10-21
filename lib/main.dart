import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/planets_exploration/data/dataSource/planets_local_data_source.dart';
import 'package:space_app/features/planets_exploration/data/repo/planets_repository_impl.dart';
import 'package:space_app/features/planets_exploration/domain/usecase/planet_usecase.dart';
import 'package:space_app/features/planets_exploration/presentation/controller/planets_cubit.dart';
import 'package:space_app/features/planets_exploration/presentation/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanetsCubit(
        getPlanetsUseCase: GetPlanetsUseCase(
          repository: PlanetsRepositoryImpl(
            localDataSource: PlanetsLocalDataSourceImpl(),
          ),
        ),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Space App',
        home: Login(),
      ),
    );
  }
}
