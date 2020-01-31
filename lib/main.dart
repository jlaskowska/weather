import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather/configs/app_colors.dart';
import 'package:weather/states/app_state.dart';
import 'package:weather/widgets/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.darkBlue,
          accentColor: AppColors.shadowColor,
          fontFamily: GoogleFonts.oswald().fontFamily,
          scaffoldBackgroundColor: AppColors.darkBlue,
          indicatorColor: Colors.white,
        ),
        home: Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
  }
}
