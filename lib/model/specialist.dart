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
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['image'] = image;
    data['email'] = email;
    data['verification_code'] = verificationCode;
    data['mobile'] = mobile;
    data['jobTitle'] = jobTitle;
    data['bio'] = bio;
    data['zipCode'] = zipCode;
    data['active'] = active;
    data['visablity'] = visablity;
    return data;
  }
}
