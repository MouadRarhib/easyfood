class Food {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final double stars;
  final int reviews;
  final String street;
  final String city;
  final String country;
  final double price;
  int quantity; // New property to represent the quantity

  Food({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.stars,
    required this.reviews,
    required this.street,
    required this.city,
    required this.country,
    required this.price,
    required this.quantity, // Initialize quantity to 0 by default
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      stars: json['stars'].toDouble(), // Convert stars to double
      reviews: json['reviews'], // Keep reviews as int
      street: json['street'],
      city: json['city'],
      country: json['country'],
      price: json['price'].toDouble(), // Convert price to double
      quantity: 0, // Initialize quantity to 0 when creating from JSON
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'stars': stars,
      'reviews': reviews,
      'street': street,
      'city': city,
      'country': country,
      'price': price,
      'quantity': quantity, // Include quantity in the JSON representation
    };
  }
}
