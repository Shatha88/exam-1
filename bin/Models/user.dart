// ignore_for_file: camel_case_types

class User {
  String? email;
  String? password;
  String? name;
  int? age;
  String? address;

  User({this.email, this.password, this.name, this.age, this.address});

  factory User.fromJson({required Map json}) {
    return User(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      age: json['age'],
      address: json['address'],
    );
  }

  toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'age': age,
      'address': address,
    };
  }
}
