class RatingModel {
  final String ratingName;
  final double ratingValue;

  RatingModel({
    required this.ratingName,
    required this.ratingValue,
  });

  factory RatingModel.fromJson(dynamic json) => RatingModel(
        ratingName: json['ratingName'],
        ratingValue: json['ratingValue'],
      );

  Map<String, dynamic> toJson() => {
        'ratingName': ratingName,
        'ratingValue': ratingValue,
      };
}
