import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:weather_app/Core/utils/app_validators.dart';
import 'package:weather_app/Core/utils/routes_manager/routes.dart';
import 'package:weather_app/Data/Models/user_model.dart';

import 'package:weather_app/Presentation/controllers/signin_viewmodel.dart';

import 'package:weather_app/Presentation/widgets/custom_button.dart';
import 'package:weather_app/Presentation/widgets/custom_text_form_field.dart';
import 'package:weather_app/Presentation/widgets/logo_widget.dart';

import '../../../Core/DI/di.dart';
import '../../../Core/utils/fonts.dart';


class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var viewModel = SignInViewModel(getIt());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<SignInViewModel, SignInState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 1.sh),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30.h,
                    horizontal: 50.w,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LogoWidget(),
                        Text(
                          "SignIn",
                          style: Fonts().authTitle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.h),
                        CustomTextFormField(
                          label: "Email",
                          hintText: "please enter your email",
                          validation: AppValidators.validateEmail,
                          controller: emailController,
                        ),
                        CustomTextFormField(
                          label: "Password",
                          hintText: "please enter your password",
                          validation: AppValidators.validatePassword,
                          controller: passwordController,
                          isObscured: true,
                          suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        ),
                        CustomElevatedButton(
                          label: "SignIn",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context.read<SignInViewModel>().signIn(
                                UserModel(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          switch (state) {
            case SignInInitialState():
              {}
            case SignInErrorState():
              {
                PanaraInfoDialog.show(
                  context,
                  title: "Oops!",
                  message: "${state.errorMsg!} \n please try again",
                  buttonText: "Okay",
                  onTapDismiss: () {
                    Navigator.pop(context);
                  },
                  panaraDialogType: PanaraDialogType.error,
                );
              }
            case SignInSuccessState():
              {
                PanaraInfoDialog.show(
                  context,
                  title: "Signed In Successfully",
                  message: "Welcome!",
                  buttonText: "Okay",
                  onTapDismiss: () {
                    Navigator.pushReplacementNamed(context, Routes.homeRoute);
                  },
                  panaraDialogType: PanaraDialogType.success,
                );
              }
          }
        },
      ),
    );
  }
}
