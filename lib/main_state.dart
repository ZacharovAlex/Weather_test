
import 'package:freezed_annotation/freezed_annotation.dart';

import 'getWeatherResponse.dart';
import 'open_weather_models/forecast_model/forecastResponse.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    required getWetherFromCoordinates? weatherResponse,
    required ForecastResponse? forecastResponse,
  }) = _MainState;
}
