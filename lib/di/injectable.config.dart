// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../dadata/autocompleteApi.dart' as _i4;
import '../getWeatherResponse.dart' as _i9;
import '../main_cubit.dart' as _i8;
import '../open_weather_models/forecast_model/forecastResponse.dart' as _i10;
import '../repository/repository_weather.dart' as _i7;
import '../repository/repostory_dadata.dart' as _i3;
import '../wether_api.dart' as _i6;
import 'modules/network_module.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.DadataRepository>(
      _i3.DadataRepository(get<_i4.AutocompleteApi>()));
  gh.lazySingleton<_i5.Dio>(() => registerModule.dio());
  gh.lazySingleton<_i6.WetherApi>(
      () => registerModule.wetherApi(get<_i5.Dio>()));
  gh.singleton<_i7.WeatherRepository>(
      _i7.WeatherRepository(get<_i6.WetherApi>()));
  gh.factoryParam<_i8.MainCubit, _i9.getWetherFromCoordinates?,
      _i10.ForecastResponse?>((
    weather,
    weatherForecast,
  ) =>
      _i8.MainCubit(
        weather,
        weatherForecast,
        get<_i7.WeatherRepository>(),
        get<_i3.DadataRepository>(),
        get<_i11.StreamSubscription<dynamic>>(),
      ));
  return get;
}

class _$RegisterModule extends _i12.RegisterModule {}
