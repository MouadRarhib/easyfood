class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      phone: json['user']['phone'],
      emailVerifiedAt: json['user']['email_verified_at'] != null
          ? DateTime.parse(json['user']['email_verified_at'])
          : null,
      createdAt: DateTime.parse(json['user']['created_at']),
      updatedAt: DateTime.parse(json['user']['updated_at']),
    );
  }
}
