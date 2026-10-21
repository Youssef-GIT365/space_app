import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:space_app/features/planets_exploration/data/model/planet_model.dart';

abstract class PlanetsLocalDataSource {
  Future<List<PlanetModel>> getPlanetsFromSheet();
}

class PlanetsLocalDataSourceImpl extends PlanetsLocalDataSource {
  @override
  Future<List<PlanetModel>> getPlanetsFromSheet() async {
    final response = await rootBundle.loadString(
      "assets/Solar_System_Data/solar_system_data.json",
    );
    final List<dynamic> data = json.decode(response);
    return data.map((jsonItem) => PlanetModel.fromJson(jsonItem)).toList();
  }
}
