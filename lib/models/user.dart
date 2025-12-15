class User {
  final String name;
  final String email;
  final String avatar;

  const User({required this.name, required this.email, required this.avatar});

  User copyWith({String? name, String? email, String? avatar}) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }
}
