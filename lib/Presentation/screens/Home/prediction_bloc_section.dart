import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/Domain/Entities/forecast_day.dart';
import 'package:weather_app/Domain/Entities/prediction_data.dart';

import '../../../Core/DI/di.dart';
import '../../controllers/predict_viewmodel.dart';

class PredictionBlocSection extends StatefulWidget {
  ForecastDay selectedForecast;
  PredictionBlocSection({required this.selectedForecast});

  @override
  State<PredictionBlocSection> createState() => _PredictionBlocSectionState();
}

class _PredictionBlocSectionState extends State<PredictionBlocSection> {
  final predictViewModel = WeatherPredictionViewModel(getIt());
  @override
  void initState() {
    super.initState();
    predictViewModel.getPrediction(
      PredictionData(
        conditionText: widget.selectedForecast.day!.condition!.text,
        avgTemp: widget.selectedForecast.day!.avgtempC,
        avgHumidity: widget.selectedForecast.day!.avghumidity,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => predictViewModel,
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w, vertical: 25.h),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tennis Status  ",
                  style: TextStyle(fontSize: 15, color: Colors.white38),
                ),
                Icon(Icons.sports_tennis, size: 20, color: Color(0xFF625b71)),
              ],
            ),
            BlocBuilder<WeatherPredictionViewModel, PredictionState>(
              builder: (context, state) {
                switch (state) {
                  case PredictionSuitableState():
                    {
                      print(widget.selectedForecast.day!.avghumidity);
                      return Text(
                        state.prediction!,
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  case PredictionNotRecomState():
                    {
                      return Text(
                        state.prediction!,
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  case PredictionInitialState():
                    {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  case PredictionErrorState():
                    {
                      return Text(
                        state.errorMsg!,
                        style: TextStyle(color: Colors.white),
                      );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
