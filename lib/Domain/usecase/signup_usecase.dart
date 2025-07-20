import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/Models/user_model.dart';
import 'package:weather_app/Domain/repository/auth_repo.dart';
@injectable
class SignUpUseCase{
  BaseAuthRepository repository;
  @factoryMethod
  SignUpUseCase(this.repository);
  Future<Result> signUp(UserModel user){
    return repository.signUp(user);
  }
}