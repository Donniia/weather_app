import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Core/utils/routes_manager/routes.dart';
import 'Core/utils/routes_manager/routes_generator.dart';
import 'Core/utils/theme.dart';
import 'Data/DI/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: "https://isddhznzunaxnsydpnso.supabase.co",
      anonKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlzZGRoem56dW5heG5zeWRwbnNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIwMTY4MTAsImV4cCI6MjA2NzU5MjgxMH0.3BSWxcMWBOpmdzHRVZpA-PLw-VPqTsCjKMDvQv2sVz8"
  );
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
     designSize: const Size(728, 1226),
     minTextAdapt: true,
     builder:(context, child) {
       return MaterialApp(
         debugShowCheckedModeBanner: false,
         onGenerateRoute: RoutesGenerator.getRoute,
         initialRoute: Routes.splashRoute,
         theme: AppTheme.lightTheme,
       );
     } ,
   );
  }
}

