class Weather {
  final String? city;
  final num? condition;
  final String? description;
  final double? temperature;
  final num? wind;
  final num? humidity;

  Weather({
    this.city,
     this.condition,
    this.description,
    this.temperature,
    this.wind,
    this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
       condition: json['weather'][0]['id'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
      wind: json['wind']['speed'],
      humidity: json['main']['humidity'],
    );
  }
}
