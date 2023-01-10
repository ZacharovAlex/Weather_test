// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../getWeatherResponse.dart' as _i7;
import '../main_cubit.dart' as _i6;
import '../repository/repository_weather.dart' as _i5;
import '../wether_api.dart' as _i4;
import 'modules/network_module.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio());
  gh.lazySingleton<_i4.WetherApi>(
      () => registerModule.wetherApi(get<_i3.Dio>()));
  gh.singleton<_i5.WeatherRepository>(
      _i5.WeatherRepository(get<_i4.WetherApi>()));
  gh.factoryParam<_i6.MainCubit, _i7.getWetherFromCoordinates?, dynamic>((
    weather,
    _,
  ) =>
      _i6.MainCubit(
        weather,
        get<_i5.WeatherRepository>(),
      ));
  return get;
}

class _$RegisterModule extends _i8.RegisterModule {}
