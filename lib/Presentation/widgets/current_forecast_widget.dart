import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Domain/Entities/current.dart';

class CurrentForecastWidget extends StatelessWidget {
  final Current? currentTemp;
  CurrentForecastWidget({this.currentTemp});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 10.h),
            Text(
              "Current Temp: ${currentTemp?.tempC}°C",
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
           // Divider(
           //   color: Colors.black26,
           //   thickness: 2.5,
           // ),

           //

          ],
        ),
      ),
    );
  }
}
