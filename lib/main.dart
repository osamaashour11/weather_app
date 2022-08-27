import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_flutter_weather/layout/home_layout/home_layout.dart';
import 'package:new_flutter_weather/shared/bloc_observer/bloc_observer.dart';
import 'package:new_flutter_weather/shared/constants/constants.dart';
import 'package:new_flutter_weather/shared/dio/dio_helper/dio_helper.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primaryColor: defaultAppColor,
        primarySwatch:defaultAppColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
          elevation: 10.00,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}