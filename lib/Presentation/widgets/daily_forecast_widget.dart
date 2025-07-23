import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Domain/Entities/forecast_day.dart';
import 'info_card.dart';

class DailyForecastWidget extends StatelessWidget {
  final ForecastDay? selectedForecast;
  DailyForecastWidget({required this.selectedForecast});

  @override
  Widget build(BuildContext context) {
    return Center(
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.thermostat, color: Colors.redAccent),
                    SizedBox(height: 5),
                    Text(
                      "Max: ${selectedForecast!.day!.maxtempC}°C",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.ac_unit, color: Colors.blueAccent),
                    SizedBox(height: 5),
                    Text(
                      "Min: ${selectedForecast?.day?.mintempC}°C",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Condition: ${selectedForecast?.day?.condition?.text}",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Image.network(
                  "https:${selectedForecast?.day?.condition?.icon}",
                  height: 100.h,
                  width: 100.w,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(
                  title: "Humidity",
                  value: "${selectedForecast?.day?.avghumidity}%",
                  icon: Icons.water_drop,
                ),
                InfoCard(
                  title: "Wind",
                  value: "${selectedForecast?.day?.maxwindKph} km/h",
                  icon: Icons.wind_power,
                ),
                InfoCard(
                  title: "UV",
                  value: "${selectedForecast?.day?.uv}",
                  icon: Icons.wb_sunny,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
