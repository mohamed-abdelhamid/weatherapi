import '../model/network.dart';
import '../model/weather_model.dart';

class WeatherController{
  Future<WeatherModel> getWeather()async{
    String url = "https://api.weatherapi.com/v1/current.json?q=cairo&key=${}";
    Networking networking = Networking();
    final response = await networking.fetchData(url);
    WeatherModel weatherModel = WeatherModel(temp: response['current']['temp_c'], conditionText: response['current']['condition']['text']);
    print(weatherModel.conditionText);
    return weatherModel;
  }

}