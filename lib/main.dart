import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/configs/app_colors.dart';
import 'package:weather/widgets/home_screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.darkBlue,
        accentColor: AppColors.shadowColor,
        fontFamily: GoogleFonts.mavenPro().fontFamily,
      ),
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
