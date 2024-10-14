class Usermodel {
  String name;
  String id;
  String email;
  String pass;

  Usermodel(
      {required this.email,
      required this.name,
      required this.pass,
      required this.id});

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'pass': pass, 'id': id};
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      pass: map['pass'],
    );
  }
}
