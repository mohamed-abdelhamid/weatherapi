import 'package:flutter/material.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _State();
}

class _State extends State<WeatherScreen> {

  Future<WeatherModel>? _getWeather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather();
  }

  getWeather(){
    WeatherController weatherController = WeatherController();
    _getWeather = weatherController.getWeather() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/background.jpg'))
        ),
        child: FutureBuilder(
          future: _getWeather,
          builder: (context,asyncSnapshot){
            if (asyncSnapshot.connectionState == ConnectionState.done){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        Text('${asyncSnapshot.data?.temp}',style: TextStyle(fontSize: 20,color: Colors.red),),
                        Text('${asyncSnapshot.data?.conditionText}',style: TextStyle(fontSize: 20,color: Colors.red),),
                      ],
                    ),
                  ),
                ],
              );
            }else{
              return Center(child: const CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
