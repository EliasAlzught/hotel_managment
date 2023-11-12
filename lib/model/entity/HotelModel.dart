class HotelModel {
  final String name;
  final int stars;
  final double price;
  final String currency;
  final String image;
  final double reviewScore;
  final String review;
  final String address;

  HotelModel({
    required this.name,
    required this.stars,
    required this.price,
    required this.currency,
    required this.image,
    required this.reviewScore,
    required this.review,
    required this.address,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      name: json['name'],
      stars: json['starts'],
      price: json['price'].toDouble(),
      currency: json['currency'],
      image: json['image'],
      reviewScore: json['review_score'].toDouble(),
      review: json['review'],
      address: json['address'],
    );
  }
}