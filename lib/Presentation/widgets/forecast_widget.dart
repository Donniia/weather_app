import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Data/Response/current.dart';
import 'package:weather_app/Data/Response/forecast_day.dart';
import 'package:weather_app/Data/Response/location.dart';
import 'package:weather_app/Presentation/widgets/info_card.dart';

class ForecastWidget extends StatelessWidget {
  final Location? location;
  final ForecastDay? selectedForecast;
  final Current? currentTemp;
  ForecastWidget({this.location, this.selectedForecast, this.currentTemp});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          location!.name ?? "",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          " Temp: ${currentTemp?.tempC}°C",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          textAlign: TextAlign.start,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Current Condition: ${currentTemp?.condition?.text}",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Image.network(
              "https:${currentTemp?.condition?.icon}",
            ),
          ],
        ),
       Divider(
         color: Colors.black26,
         thickness: 2.5,
       ),
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
    );
  }
}
