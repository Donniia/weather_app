import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/Models/user_model.dart';
import 'package:weather_app/Data/supabase.dart';

abstract class BaseAuthDataSource {
  Future<Result> signUp(UserModel user);
  Future<Result> signIn(UserModel user);

}

@Injectable(as:BaseAuthDataSource )
class AuthDataSource extends BaseAuthDataSource {
  SupaBase data;
  @factoryMethod
  AuthDataSource(this.data);

  @override
  Future<Result> signUp(UserModel user) async {
    var result = await data.signUp(user);
    switch (result) {
      case Success():
        {
          return Success(result.data);
        }
      case Error():
        {
          return Error(result.errorMsg);
        }
    }
  }

  @override
  Future<Result> signIn(UserModel user) async{
    var result = await data.signIn(user);
    switch (result) {

      case Success():
        {
          return Success(result.data);
        }
      case Error():
        {
          return Error(result.errorMsg);
        }
    }
  }


}
