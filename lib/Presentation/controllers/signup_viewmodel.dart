import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/Models/user_model.dart';
import 'package:weather_app/Data/Repository/auth_repo.dart';


class SignUpViewModel extends Cubit<SignUpState> {
  BaseAuthRepository repository;
  SignUpViewModel(this.repository) : super(SignUpInitialState());
  signUp(UserModel user) async {
    var result = await repository.signUp(user);
    switch (result) {
      case Success():
        {
          emit(SignUpSuccessState());
        }
      case Error():
        {
          emit(SignUpErrorState(result.errorMsg));
        }
    }
  }
}

sealed class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  String? errorMsg;
  SignUpErrorState(this.errorMsg);
}

class SignUpSuccessState extends SignUpState {}
