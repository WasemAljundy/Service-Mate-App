class EducationDegree {
  late int id;
  late int specialistId;
  late String title;
  late String degree;
  late String degreeName;
  late String degreeDate;
  late String image;
  late String universityName;



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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['degree'] = degree;
    data['degree_name'] = degreeName;
    data['degree_date'] = degreeDate;
    data['image'] = image;
    data['university_name'] = universityName;
    data['specialist_id'] = specialistId;

    return data;
  }
}
