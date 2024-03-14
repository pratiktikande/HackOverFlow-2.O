class Post{
  final String name;
  final String email;
  final String password;
  Post({
    required this.name,
    required this.email,
    required this.password,
  });
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    name: json['name'],
    email: json['email'],
    password: json['password'],
  );
}
