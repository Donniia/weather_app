import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/Core/utils/routes_manager/routes.dart';
import 'package:weather_app/Presentation/widgets/custom_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 50.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              "assets/svgs/weather_svg.svg",
              width: 400.w,
              height: 400.h,
            ),
            CustomElevatedButton(
              label: "SignIn",
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.signInRoute),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomElevatedButton(
              label: "SignUp",
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.signupRoute),
            ),
          ],
        ),
      ),
    );
  }
}
