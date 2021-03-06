import 'package:intl/intl.dart';

class HourlyWeather {
  String weatherIconUrl;
  String time;
  double temperature;

  HourlyWeather({
    required this.weatherIconUrl,
    required this.time,
    required this.temperature,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    final unixTime = json['time_epoch'] as int;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    final hourOfDay = DateFormat.jm().format(dateTime);

    final apiImageUrl = json['condition']['icon'] ?? '';
    String appendedImageUrl = ('https:$apiImageUrl');

    return HourlyWeather(
        weatherIconUrl: appendedImageUrl,
        time: hourOfDay,
        temperature: json['temp_c'] ?? 0);
  }
}
