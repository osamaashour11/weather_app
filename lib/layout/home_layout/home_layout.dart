import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_weather/shared/components/components.dart';
import 'package:new_flutter_weather/shared/constants/constants.dart';
import 'package:new_flutter_weather/shared/cubit/cubit.dart';
import 'package:new_flutter_weather/shared/cubit/state.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherAppCubit(),
      child: BlocConsumer<WeatherAppCubit, WeatherAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = WeatherAppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(image: AssetImage('assets/images/cloudy.png')),
              ),
              titleSpacing: 0.00,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  defaultText(
                    text: 'W',
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: defaultTitleColor,
                  ),
                  defaultText(
                    text: 'eather',
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  defaultText(
                    text: ' app',
                    fontSize: 25,
                    color: defaultTitleColor,
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.00),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: defaultTitleColor.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                )
                              ],
                            ),
                            child: TextFormField(
                              controller: searchController,
                              onFieldSubmitted: (value) {
                                cubit.getWeatherData(
                                    city: searchController.text);
                              },
                              decoration: InputDecoration(
                                hintText: 'city',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FloatingActionButton(
                          backgroundColor: defaultAppColor,
                          onPressed: () {
                            cubit.getWeatherData(city: searchController.text);
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ConditionalBuilder(
                      condition: state is WeatherSuccessDataAppState,
                      builder: (context) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultText(
                            text: 'Your country code is ${cubit.weatherModel!.sys!.country}',
                            color: defaultAppColor,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 120.00,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                    image:
                                        AssetImage('assets/images/cloudy.png'),
                                    height: 100,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Expanded(
                                        child: SizedBox(
                                          height: 10,
                                        ),
                                      ),
                                      defaultText(
                                        text: '${cubit.weatherModel!.name}',
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: defaultAppColor,
                                      ),
                                      const Spacer(),
                                      defaultText(
                                        text:
                                            '${cubit.weatherModel!.main!.temp}°',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: defaultAppColor,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  defaultDataItem(
                                    url: 'assets/images/target.png',
                                    name: 'Feels like',
                                    result:
                                        '${cubit.weatherModel!.main!.feelsLike}',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  defaultDataItem(
                                    url: 'assets/images/down.png',
                                    name: 'Temperature min',
                                    result:
                                        '${cubit.weatherModel!.main!.tempMin}',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  defaultDataItem(
                                    url: 'assets/images/up.png',
                                    name: 'Temperature max',
                                    result:
                                        '${cubit.weatherModel!.main!.tempMax}',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  defaultDataItem(
                                    url: 'assets/images/resilience.png',
                                    name: 'Pressure',
                                    result:
                                        '${cubit.weatherModel!.main!.pressure}',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  defaultDataItem(
                                    url: 'assets/images/humidity.png',
                                    name: 'Humidity',
                                    result:
                                        '${cubit.weatherModel!.main!.humidity}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      fallback: (context) => Center(
                        child: Column(
                          children: [
                            const Image(
                                image: AssetImage('assets/images/Frame.png')),
                            const SizedBox(
                              height: 30,
                            ),
                            defaultText(
                              text: 'Please, enter your city.',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: defaultAppColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
