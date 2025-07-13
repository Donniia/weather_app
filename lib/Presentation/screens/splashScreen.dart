import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/Core/utils/assets_manager.dart';
import 'package:weather_app/Core/utils/fonts.dart';
import 'package:weather_app/Core/utils/routes_manager/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigate()  {
    final session = Supabase.instance.client.auth.currentUser;
    if (session != null) {
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.startScreenRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        navigate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SvgManager.weatherSvg,
              width: 428.w,
              height: 428.h,
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(text: "Weather \n", style: Fonts().title1),
                  TextSpan(text: "Forecasts", style: Fonts().title2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
