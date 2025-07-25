// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Data/ApiManager/api.dart' as _i132;
import '../../Data/DataSoucre/auth_data_source.dart' as _i357;
import '../../Data/DataSoucre/forecast_data_source.dart' as _i405;
import '../../Data/RepositoryImp/auth_repo.dart' as _i641;
import '../../Data/RepositoryImp/forecast_repo_imp.dart' as _i312;
import '../../Data/RepositoryImp/predict_repo_imp.dart' as _i783;
import '../../Data/supabase.dart' as _i620;
import '../../Domain/repository/auth_repo.dart' as _i561;
import '../../Domain/repository/forecast_repo.dart' as _i1051;
import '../../Domain/repository/predict_repo.dart' as _i656;
import '../../Domain/usecase/current_forecast_usecase.dart' as _i967;
import '../../Domain/usecase/forecast_usecase.dart' as _i474;
import '../../Domain/usecase/location_usecase.dart' as _i227;
import '../../Domain/usecase/signin_usecase.dart' as _i899;
import '../../Domain/usecase/signup_usecase.dart' as _i1071;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i132.Api>(() => _i132.Api());
    gh.singleton<_i620.SupaBase>(() => _i620.SupaBase());
    gh.factory<_i656.PredictRepository>(() => _i783.PredictRepoImp());
    gh.factory<_i405.BaseForecastDataSource>(
      () => _i405.ForecastDataSource(gh<_i132.Api>()),
    );
    gh.factory<_i357.BaseAuthDataSource>(
      () => _i357.AuthDataSource(gh<_i620.SupaBase>()),
    );
    gh.factory<_i1051.BaseForecastRepository>(
      () => _i312.ForecastRepository(gh<_i405.BaseForecastDataSource>()),
    );
    gh.factory<_i561.BaseAuthRepository>(
      () => _i641.AuthRepository(gh<_i357.BaseAuthDataSource>()),
    );
    gh.factory<_i899.SignInUseCase>(
      () => _i899.SignInUseCase(gh<_i561.BaseAuthRepository>()),
    );
    gh.factory<_i1071.SignUpUseCase>(
      () => _i1071.SignUpUseCase(gh<_i561.BaseAuthRepository>()),
    );
    gh.factory<_i967.CurrentForecastUseCase>(
      () => _i967.CurrentForecastUseCase(gh<_i1051.BaseForecastRepository>()),
    );
    gh.factory<_i227.LocationUseCase>(
      () => _i227.LocationUseCase(gh<_i1051.BaseForecastRepository>()),
    );
    gh.factory<_i474.DailyForecastUseCase>(
      () => _i474.DailyForecastUseCase(gh<_i1051.BaseForecastRepository>()),
    );
    return this;
  }
}
