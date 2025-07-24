import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/Models/user_model.dart';
import 'package:weather_app/Domain/repository/auth_repo.dart';

@injectable
class SignInUseCase {
  BaseAuthRepository repository;
  @factoryMethod
  SignInUseCase(this.repository);
  Future<Result> invoke(UserModel user) {
    return repository.signIn(user);
  }
}
