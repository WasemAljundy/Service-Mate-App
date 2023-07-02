class Specialist {
  late int id;
  late int active;
  late String fullName;
  late String gender;
  late String birthdate;
  late String image;
  late String email;
  late String verificationCode;
  late String mobile;
  late String jobTitle;
  late String bio;
  late String zipCode;
  late String visablity;

  Specialist();

  Specialist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    image = json['image'];
    email = json['email'];
    verificationCode = json['verification_code'];
    mobile = json['mobile'];
    jobTitle = json['jobTitle'];
    bio = json['bio'];
    zipCode = json['zipCode'];
    active = json['active'];
    visablity = json['visablity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['birthdate'] = this.birthdate;
    data['image'] = this.image;
    data['email'] = this.email;
    data['verification_code'] = this.verificationCode;
    data['mobile'] = this.mobile;
    data['jobTitle'] = this.jobTitle;
    data['bio'] = this.bio;
    data['zipCode'] = this.zipCode;
    data['active'] = this.active;
    data['visablity'] = this.visablity;
    return data;
  }
}
