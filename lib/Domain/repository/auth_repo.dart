import '../../Core/result.dart';
import '../../Data/Models/user_model.dart';

abstract class BaseAuthRepository {
  Future<Result> signUp(UserModel user);
  Future<Result> signIn(UserModel user);

}
