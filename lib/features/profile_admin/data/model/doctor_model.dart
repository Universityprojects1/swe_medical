class DoctorModel {
  String? name ;
  String? dates;
  String? descriptionProfile;
  String? highlights;
  String? descriptionCareerPath;
  String? experience;

  DoctorModel(this.name, this.dates, this.descriptionProfile, this.highlights,
      this.descriptionCareerPath, this.experience);

  DoctorModel.fromJson(dynamic json){
    name = json["name"];
    dates = json["dates"];
    descriptionProfile = json["decriptionProfile"];
    highlights = json["Highlights"];
    descriptionCareerPath = json["descriptionCareerPath"];
    experience = json["experience"];
  }
}