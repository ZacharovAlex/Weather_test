// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainState {
  AppError? get error => throw _privateConstructorUsedError;
  NowOrForecast get nowOrForecast => throw _privateConstructorUsedError;
  int get dayForecasting => throw _privateConstructorUsedError;
  getWetherFromCoordinates? get weatherResponse =>
      throw _privateConstructorUsedError;
  ForecastResponse? get forecastResponse => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  List<List<ForecastDateList>>? get arrayForecastByDays =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call(
      {AppError? error,
      NowOrForecast nowOrForecast,
      int dayForecasting,
      getWetherFromCoordinates? weatherResponse,
      ForecastResponse? forecastResponse,
      bool selected,
      List<List<ForecastDateList>>? arrayForecastByDays});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? nowOrForecast = null,
    Object? dayForecasting = null,
    Object? weatherResponse = freezed,
    Object? forecastResponse = freezed,
    Object? selected = null,
    Object? arrayForecastByDays = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
      nowOrForecast: null == nowOrForecast
          ? _value.nowOrForecast
          : nowOrForecast // ignore: cast_nullable_to_non_nullable
              as NowOrForecast,
      dayForecasting: null == dayForecasting
          ? _value.dayForecasting
          : dayForecasting // ignore: cast_nullable_to_non_nullable
              as int,
      weatherResponse: freezed == weatherResponse
          ? _value.weatherResponse
          : weatherResponse // ignore: cast_nullable_to_non_nullable
              as getWetherFromCoordinates?,
      forecastResponse: freezed == forecastResponse
          ? _value.forecastResponse
          : forecastResponse // ignore: cast_nullable_to_non_nullable
              as ForecastResponse?,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      arrayForecastByDays: freezed == arrayForecastByDays
          ? _value.arrayForecastByDays
          : arrayForecastByDays // ignore: cast_nullable_to_non_nullable
              as List<List<ForecastDateList>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainStateCopyWith<$Res> implements $MainStateCopyWith<$Res> {
  factory _$$_MainStateCopyWith(
          _$_MainState value, $Res Function(_$_MainState) then) =
      __$$_MainStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppError? error,
      NowOrForecast nowOrForecast,
      int dayForecasting,
      getWetherFromCoordinates? weatherResponse,
      ForecastResponse? forecastResponse,
      bool selected,
      List<List<ForecastDateList>>? arrayForecastByDays});
}

/// @nodoc
class __$$_MainStateCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$_MainState>
    implements _$$_MainStateCopyWith<$Res> {
  __$$_MainStateCopyWithImpl(
      _$_MainState _value, $Res Function(_$_MainState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? nowOrForecast = null,
    Object? dayForecasting = null,
    Object? weatherResponse = freezed,
    Object? forecastResponse = freezed,
    Object? selected = null,
    Object? arrayForecastByDays = freezed,
  }) {
    return _then(_$_MainState(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
      nowOrForecast: null == nowOrForecast
          ? _value.nowOrForecast
          : nowOrForecast // ignore: cast_nullable_to_non_nullable
              as NowOrForecast,
      dayForecasting: null == dayForecasting
          ? _value.dayForecasting
          : dayForecasting // ignore: cast_nullable_to_non_nullable
              as int,
      weatherResponse: freezed == weatherResponse
          ? _value.weatherResponse
          : weatherResponse // ignore: cast_nullable_to_non_nullable
              as getWetherFromCoordinates?,
      forecastResponse: freezed == forecastResponse
          ? _value.forecastResponse
          : forecastResponse // ignore: cast_nullable_to_non_nullable
              as ForecastResponse?,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      arrayForecastByDays: freezed == arrayForecastByDays
          ? _value._arrayForecastByDays
          : arrayForecastByDays // ignore: cast_nullable_to_non_nullable
              as List<List<ForecastDateList>>?,
    ));
  }
}

/// @nodoc

class _$_MainState implements _MainState {
  const _$_MainState(
      {this.error,
      this.nowOrForecast = NowOrForecast.now,
      this.dayForecasting = 0,
      required this.weatherResponse,
      required this.forecastResponse,
      this.selected = false,
      final List<List<ForecastDateList>>? arrayForecastByDays})
      : _arrayForecastByDays = arrayForecastByDays;

  @override
  final AppError? error;
  @override
  @JsonKey()
  final NowOrForecast nowOrForecast;
  @override
  @JsonKey()
  final int dayForecasting;
  @override
  final getWetherFromCoordinates? weatherResponse;
  @override
  final ForecastResponse? forecastResponse;
  @override
  @JsonKey()
  final bool selected;
  final List<List<ForecastDateList>>? _arrayForecastByDays;
  @override
  List<List<ForecastDateList>>? get arrayForecastByDays {
    final value = _arrayForecastByDays;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MainState(error: $error, nowOrForecast: $nowOrForecast, dayForecasting: $dayForecasting, weatherResponse: $weatherResponse, forecastResponse: $forecastResponse, selected: $selected, arrayForecastByDays: $arrayForecastByDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainState &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.nowOrForecast, nowOrForecast) ||
                other.nowOrForecast == nowOrForecast) &&
            (identical(other.dayForecasting, dayForecasting) ||
                other.dayForecasting == dayForecasting) &&
            (identical(other.weatherResponse, weatherResponse) ||
                other.weatherResponse == weatherResponse) &&
            (identical(other.forecastResponse, forecastResponse) ||
                other.forecastResponse == forecastResponse) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            const DeepCollectionEquality()
                .equals(other._arrayForecastByDays, _arrayForecastByDays));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      error,
      nowOrForecast,
      dayForecasting,
      weatherResponse,
      forecastResponse,
      selected,
      const DeepCollectionEquality().hash(_arrayForecastByDays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainStateCopyWith<_$_MainState> get copyWith =>
      __$$_MainStateCopyWithImpl<_$_MainState>(this, _$identity);
}

abstract class _MainState implements MainState {
  const factory _MainState(
      {final AppError? error,
      final NowOrForecast nowOrForecast,
      final int dayForecasting,
      required final getWetherFromCoordinates? weatherResponse,
      required final ForecastResponse? forecastResponse,
      final bool selected,
      final List<List<ForecastDateList>>? arrayForecastByDays}) = _$_MainState;

  @override
  AppError? get error;
  @override
  NowOrForecast get nowOrForecast;
  @override
  int get dayForecasting;
  @override
  getWetherFromCoordinates? get weatherResponse;
  @override
  ForecastResponse? get forecastResponse;
  @override
  bool get selected;
  @override
  List<List<ForecastDateList>>? get arrayForecastByDays;
  @override
  @JsonKey(ignore: true)
  _$$_MainStateCopyWith<_$_MainState> get copyWith =>
      throw _privateConstructorUsedError;
}
