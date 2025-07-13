import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/Data/Models/user_model.dart';

import '../Core/result.dart';

@singleton
class SupaBase {
  final client = Supabase.instance.client;
  Future<Result> signUp(UserModel user) async {
    try {
      final response = await client.auth.signUp(
          email: user.email,
          password: user.password,
     );
      await client.auth.updateUser(UserAttributes(
        data: {'display_name': user.name},
      ));
      if (response.user != null) {
        return Success(response.user);
      } else {
        return Error("Sign up failed. Try again.");
      }
    } on AuthException catch (e) {
      if (e.message.contains('already registered') ||
          e.message.contains('email address is already in use')) {
        return Error(
            "This email is already registered. Try logging in instead.");
      } else {
        return Error(e.message);
      }
    } catch (e) {
      return Error(e.toString());
    }
  }
  Future<Result> signIn(UserModel user) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: user.email,
        password: user.password,
      );
      if (response.user != null) {
        return Success(response.user);
      } else {
        return Error("Sign in failed. Try again.");
      }
    } on AuthException catch (e) {
      if (e.message.contains('Invalid login credentials') ||
          e.message.contains('invalid_credentials')) {
        return Error("email or password is wrong");
      } else {
        return Error(e.message);
      }
    } catch (e) {
      return Error(e.toString());
    }
  }
}
