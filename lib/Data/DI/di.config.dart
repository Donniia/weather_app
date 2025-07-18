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

import '../../Domain/repository/auth_repo.dart' as _i561;
import '../../Domain/repository/forecast_repo.dart' as _i1051;
import '../../Domain/usecase/forecast_usecase.dart' as _i474;
import '../../Domain/usecase/signin_usecase.dart' as _i899;
import '../../Domain/usecase/signup_usecase.dart' as _i1071;
import '../ApiManager/api.dart' as _i847;
import '../DataSoucre/auth_data_source.dart' as _i239;
import '../DataSoucre/forecast_data_source.dart' as _i7;
import '../RepositoryImp/auth_repo.dart' as _i770;
import '../RepositoryImp/forecast_repo_imp.dart' as _i977;
import '../supabase.dart' as _i264;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i847.Api>(() => _i847.Api());
    gh.singleton<_i264.SupaBase>(() => _i264.SupaBase());
    gh.factory<_i7.BaseForecastDataSource>(
      () => _i7.ForecastDataSource(gh<_i847.Api>()),
    );
    gh.factory<_i239.BaseAuthDataSource>(
      () => _i239.AuthDataSource(gh<_i264.SupaBase>()),
    );
    gh.factory<_i1051.BaseForecastRepository>(
      () => _i977.ForecastRepository(gh<_i7.BaseForecastDataSource>()),
    );
    gh.factory<_i561.BaseAuthRepository>(
      () => _i770.AuthRepository(gh<_i239.BaseAuthDataSource>()),
    );
    gh.factory<_i899.SignInUseCase>(
      () => _i899.SignInUseCase(gh<_i561.BaseAuthRepository>()),
    );
    gh.factory<_i1071.SignUpUseCase>(
      () => _i1071.SignUpUseCase(gh<_i561.BaseAuthRepository>()),
    );
    gh.factory<_i474.ForecastUseCase>(
      () => _i474.ForecastUseCase(gh<_i1051.BaseForecastRepository>()),
    );
    return this;
  }
}
