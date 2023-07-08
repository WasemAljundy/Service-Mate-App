class Client {
  int? id;
  String? fullName;
  String? gender;
  String? email;
  String? mobile;
  String? image;
  String? birthDate;
  String? token;
  String? password;

  Client();

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    gender = json['gender'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image_url'];
    birthDate = json['birthDate'];
    token = json['token'];
  }
}
