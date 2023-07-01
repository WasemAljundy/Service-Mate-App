class Client {
  late int id;
  late String fullName;
  late String gender;
  late String email;
  late String verificationCode;
  late String mobile;
  late String image;
  late String birthDate;


  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    gender = json['gender'];
    email = json['email'];
    verificationCode = json['verification_code'];
    mobile = json['mobile'];
    image = json['image'];
    birthDate = json['birthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['verification_code'] = this.verificationCode;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['birthDate'] = this.birthDate;
    return data;
  }
}
