class EducationDegree {
  late int id;
  late int specialistId;
  late String title;
  late String degree;
  late String degreeName;
  late String degreeDate;
  late String image;
  late String universityName;
  late String createdAt;
  late String updatedAt;


  EducationDegree();

  EducationDegree.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    degree = json['degree'];
    degreeName = json['degree_name'];
    degreeDate = json['degree_date'];
    image = json['image'];
    universityName = json['university_name'];
    specialistId = json['specialist_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['degree'] = this.degree;
    data['degree_name'] = this.degreeName;
    data['degree_date'] = this.degreeDate;
    data['image'] = this.image;
    data['university_name'] = this.universityName;
    data['specialist_id'] = this.specialistId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
