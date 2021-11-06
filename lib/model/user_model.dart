class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  late int color;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    required this.color,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    color = json['color'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'color': color,
    };
  }
}
