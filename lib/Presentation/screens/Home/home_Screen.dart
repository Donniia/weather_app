import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Core/app_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Presentation/controllers/current_forecast_viewmodel.dart';
import 'package:weather_app/Presentation/controllers/location_viewmodel.dart';
import 'package:weather_app/Presentation/screens/Home/prediction_bloc_section.dart';
import 'package:weather_app/Presentation/widgets/current_forecast_widget.dart';
import 'package:weather_app/Presentation/widgets/daily_forecast_widget.dart';

import '../../../Core/DI/di.dart';
import '../../../Domain/Entities/forecast_day.dart';
import '../../controllers/forecast_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userName = "";
  Position? userPosition;
  String? formattedDate;
  final ValueNotifier<DateTime> selectedDateNotifier = ValueNotifier(
    DateTime.now(),
  );
  final currentForecastviewModel = CurrentForecastViewModel(getIt());
  final locationViewModel = LocationViewModel(getIt());
  final dailyForecastViewModel = DailyForecastViewModel(getIt());

  @override
  void initState() {
    super.initState();
    loadUserName();
    formattedDate = _formatDate(DateTime.now());
    getUserLocation().then((position) {
      userPosition = position;
      initializeForecast(formattedDate!);
    });
  }

  @override
  void dispose() {
    selectedDateNotifier.dispose();
    super.dispose();
  }

  void initializeForecast(String date) async {
    if (userPosition != null) {
      currentForecastviewModel.getCurrentForecast(userPosition!, date);
      locationViewModel.getLocationData(userPosition!, date);
      dailyForecastViewModel.getDailyForecast(userPosition!, date);
    }
  }

  Future<Position> getUserLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> loadUserName() async {
    final name = await AppStorage.getUserName();
    setState(() {
      userName = name ?? 'Guest';
    });
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  ForecastDay? getSelectedForecast(
    List<ForecastDay> days,
    DateTime selectedDate,
  ) {
    final formattedSelected = _formatDate(selectedDate);
    return days.firstWhere(
      (day) => day.date == formattedSelected,
      orElse: () => days.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationViewModel>(create: (context) => locationViewModel),
        BlocProvider<CurrentForecastViewModel>(
          create: (context) => currentForecastviewModel,
        ),
        BlocProvider<DailyForecastViewModel>(
          create: (context) => dailyForecastViewModel,
        ),
      ],
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello \n",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: userName,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 7)),
                onDateSelected: (selectedDate) {
                  selectedDateNotifier.value = selectedDate;
                 formattedDate = _formatDate(selectedDateNotifier.value);
                 dailyForecastViewModel.getDailyForecast(userPosition!, formattedDate!);
                },
                monthColor: Colors.white70,

                dayColor: Color(0xFF625b71),
              ),
              SizedBox(height: 20.h),
              BlocBuilder<LocationViewModel, LocationState>(
                builder: (context, state) {
                  switch (state) {
                    case LocationLoadingState():
                      {
                        return Text("");
                      }
                    case LocationErrorState():
                      {
                        return Text(state.errorMsg ?? "");
                      }
                    case LocationSuccessState():
                      {
                        return Center(
                          child: Text(
                            state.location.name ?? "",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                  }
                },
              ),
              BlocBuilder<
                CurrentForecastViewModel,
                CurrentForecastState
              >(
                builder: (context, state) {
               switch (state) {

                 case CurrentForeCastLoadingState():
                  {
                    return Center(child: CircularProgressIndicator(),);
                  }
                 case CurrentForeCastSuccessState():
                 {
                   var currentTemp =state.current;
                   return  CurrentForecastWidget(currentTemp: currentTemp);
                 }
                 case CurrentForeCastErrorState():
                  {
                    return Center(child: Text(state.errorMsg??""),);
                  }
               }
                },
              ),
              SizedBox(height: 15.h,),
              BlocBuilder<DailyForecastViewModel,ForecastState>(builder: (context, state) {
                switch (state) {

                  case ForecastSuccessState():
                   {
                     final selectedForecast = getSelectedForecast(state.forecastList, selectedDateNotifier.value);
                         return Column(
                           children: [
                             DailyForecastWidget(selectedForecast: selectedForecast),
                             SizedBox(height: 15.h,),
                             PredictionBlocSection(selectedForecast: selectedForecast!)
                           ],
                         );
                   }
                  case ForecastErrorState():
                   {
                     return Text(state.errorMsg??"");
                   }
                  case ForecastLoadingState():
                    {
                      return Center(
                        child:CircularProgressIndicator(),
                      );
                    }
                }
              },)
            ],
          ),
        ),
      ),
    );
  }
}
