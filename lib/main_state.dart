
import 'package:freezed_annotation/freezed_annotation.dart';

import 'getWeatherResponse.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    required getWetherFromCoordinates? weatherResponse,
  }) = _MainState;
}
