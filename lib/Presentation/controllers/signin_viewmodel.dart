import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Domain/usecase/signin_usecase.dart';


import '../../Core/result.dart';
import '../../Data/Models/user_model.dart';

class SignInViewModel extends Cubit<SignInState>{
 SignInUseCase useCase;
  SignInViewModel(this.useCase):super(SignInInitialState());
  signIn(UserModel user) async {
    var result = await useCase.invoke(user);
    switch (result) {
      case Success():
        {
          emit(SignInSuccessState());
        }
      case Error():
        {
          emit(SignInErrorState(result.errorMsg));
        }
    }
  }
}
sealed class SignInState{}
class SignInInitialState extends SignInState{}
class SignInSuccessState extends SignInState{}
class SignInErrorState extends SignInState{
  String? errorMsg;
  SignInErrorState(this.errorMsg);
}