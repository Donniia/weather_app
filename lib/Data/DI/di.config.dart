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

import '../DataSoucre/auth_data_source.dart' as _i239;
import '../Repository/auth_repo.dart' as _i637;
import '../supabase.dart' as _i264;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i264.SupaBase>(() => _i264.SupaBase());
    gh.factory<_i239.BaseAuthDataSource>(
      () => _i239.AuthDataSource(gh<_i264.SupaBase>()),
    );
    gh.factory<_i637.BaseAuthRepository>(
      () => _i637.AuthRepository(gh<_i239.BaseAuthDataSource>()),
    );
    return this;
  }
}
