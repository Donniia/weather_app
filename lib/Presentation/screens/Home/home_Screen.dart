import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Core/app_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Data/DI/di.dart';
import 'package:weather_app/Presentation/controllers/forecast_viewmodel.dart';
import 'package:weather_app/Presentation/widgets/forecast_widget.dart';

import '../../../Data/Response/forecast_day.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userName = "";
  Position? userPosition;
  final ValueNotifier<DateTime> selectedDateNotifier = ValueNotifier(
    DateTime.now(),
  );
  final viewModel = ForecastViewModel(getIt());

  @override
  void initState() {
    super.initState();
    loadUserName();
    initializeForecast();
  }

  @override
  void dispose() {
    selectedDateNotifier.dispose();
    super.dispose();
  }

  void initializeForecast() async {
    userPosition = await getUserLocation();
    final formattedDate = _formatDate(DateTime.now());
    if (userPosition != null) {
      viewModel.getForecast(userPosition!, formattedDate);
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
    return BlocProvider(
      create: (context) => viewModel,
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
                  if (userPosition != null) {
                    final formattedDate = _formatDate(selectedDate);
                    viewModel.getForecast(userPosition!, formattedDate);
                  }
                },
                monthColor: Colors.white70,
                dayColor: Color(0xFF625b71),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Container(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 15.w,
                    vertical: 25.h,
                  ),
                  alignment: Alignment.center,
                   width: 600.w,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF3E3963), Color(0xFF191720)],
                    ),
                  ),
                  child: BlocBuilder<ForecastViewModel, ForecastState>(
                    builder: (context, state) {
                      if (state is ForeCastLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is ForeCastSuccessState) {
                        final forecastDays = state.forecasts;
                        final location = state.location;
                        final currentTemp = state.current;

                        if (forecastDays.isEmpty) {
                          return Text("No forecast available");
                        }

                        return ValueListenableBuilder<DateTime>(
                          valueListenable: selectedDateNotifier,
                          builder: (context, selectedDate, _) {
                            final selectedForecast = getSelectedForecast(
                              forecastDays,
                              selectedDate,
                            );
                            return Column(
                              children: [
                                ForecastWidget(
                                    location: location,
                                    selectedForecast: selectedForecast,
                                    currentTemp :currentTemp
                                )

                              ],
                            );
                          },
                        );
                      } else if (state is ForeCastErrorState) {
                        print(state.errorMsg ?? "");
                        return Center(
                          child: Text(
                            state.errorMsg ?? "",

                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
