class Specialist {
  late int id;
  late int active;
  late String fullName;
  late String gender;
  late String birthdate;
  late String imageUrl;
  late String email;
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
    imageUrl = json['image_url'];
    email = json['email'];
    mobile = json['mobile'];
    jobTitle = json['jobTitle'];
    bio = json['bio'];
    zipCode = json['zipCode'];
    active = json['active'];
    visablity = json['visablity'];
  }


}
