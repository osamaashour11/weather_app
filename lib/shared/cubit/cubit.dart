import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_weather/models/weather_model/weather_model.dart';
import 'package:new_flutter_weather/shared/cubit/state.dart';
import 'package:new_flutter_weather/shared/dio/dio_helper/dio_helper.dart';

class WeatherAppCubit extends Cubit<WeatherAppStates>{
  WeatherAppCubit() : super(InitializeWeatherAppState());

  static WeatherAppCubit get(context) => BlocProvider.of(context);
  WeatherModel? weatherModel;

  void getWeatherData({
    required String city,
}){
    emit(LoadingWeatherAppState());

    DioHelper.getData(query: {
      'q': city,
      'appid':'e6324cd99bd6387f7b0c69bc4ac65a61',
    }).then((value) {
      weatherModel = WeatherModel.fromJson(value.data);
      // print(weatherModel!.name);
      emit(WeatherSuccessDataAppState());
    }).catchError((error){
      emit(WeatherErrorDataAppState(error.toString()));
    });
  }
}