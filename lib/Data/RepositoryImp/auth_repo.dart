import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/DataSoucre/auth_data_source.dart';
import 'package:weather_app/Data/Models/user_model.dart';
import '../../Domain/repository/auth_repo.dart';

@Injectable(as: BaseAuthRepository)
class AuthRepository extends BaseAuthRepository {
  BaseAuthDataSource dataSource;
  @factoryMethod
  AuthRepository(this.dataSource);
  @override
  Future<Result> signUp(UserModel user) {
    return dataSource.signUp(user);
  }

  @override
  Future<Result> signIn(UserModel user) {
    return dataSource.signIn(user);
  }


}
