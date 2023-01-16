
import 'package:freezed_annotation/freezed_annotation.dart';

import 'getWeatherResponse.dart';
import 'open_weather_models/forecast_model/forecastResponse.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(0) int dayForecasting,
    required getWetherFromCoordinates? weatherResponse,
    required ForecastResponse? forecastResponse,
  }) = _MainState;
}
