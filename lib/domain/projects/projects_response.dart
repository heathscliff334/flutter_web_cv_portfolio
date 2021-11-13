class ProjectsResponse {
  bool success;
  List<Data> data;

  ProjectsResponse({this.success, this.data});

  ProjectsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int idProject;
  String projectTitle;
  String projectHeadline;
  String projectDescriptionId;
  String projectDescriptionEn;
  String projectLink;
  String projectImage;
  String dateCreated;
  String userId;

  Data(
      {this.idProject,
      this.projectTitle,
      this.projectHeadline,
      this.projectDescriptionId,
      this.projectDescriptionEn,
      this.projectLink,
      this.projectImage,
      this.dateCreated,
      this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    idProject = json['id_project'];
    projectTitle = json['project_title'];
    projectHeadline = json['project_headline'];
    projectDescriptionId = json['project_description_id'];
    projectDescriptionEn = json['project_description_en'];
    projectLink = json['project_link'];
    projectImage = json['project_image'];
    dateCreated = json['date_created'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_project'] = this.idProject;
    data['project_title'] = this.projectTitle;
    data['project_headline'] = this.projectHeadline;
    data['project_description_id'] = this.projectDescriptionId;
    data['project_description_en'] = this.projectDescriptionEn;
    data['project_link'] = this.projectLink;
    data['project_image'] = this.projectImage;
    data['date_created'] = this.dateCreated;
    data['user_id'] = this.userId;
    return data;
  }
}
