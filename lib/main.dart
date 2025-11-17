import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_indo_app/common/route/app_route.dart';
import 'package:news_indo_app/firebase_options.dart';
import 'package:news_indo_app/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  log(dotenv.env['BASE_URL'] ?? "");
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 582),
      child: GetMaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Imperial Article',
        initialRoute: AppRoute.main,
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
