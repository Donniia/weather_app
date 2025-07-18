import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/Models/user_model.dart';
import 'package:weather_app/Domain/usecase/signup_usecase.dart';

class SignUpViewModel extends Cubit<SignUpState> {
  SignUpUseCase useCase;
  SignUpViewModel(this.useCase) : super(SignUpInitialState());
  signUp(UserModel user) async {
    var result = await useCase.signUp(user);
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
