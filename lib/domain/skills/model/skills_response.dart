class SkillsResponse {
  bool? success;
  Data? data;

  SkillsResponse({this.success, this.data});

  SkillsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Skills>? skills;
  List<Languages>? languages;

  Data({this.skills, this.languages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(new Languages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Skills {
  int? idSkill;
  String? skillName;
  double? skillStar;
  int? userId;

  Skills({this.idSkill, this.skillName, this.skillStar, this.userId});

  Skills.fromJson(Map<String, dynamic> json) {
    idSkill = json['id_skill'];
    skillName = json['skill_name'];
    skillStar = json['skill_star'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_skill'] = this.idSkill;
    data['skill_name'] = this.skillName;
    data['skill_star'] = this.skillStar;
    data['user_id'] = this.userId;
    return data;
  }
}

class Languages {
  String? idLanguage;
  String? languageName;
  double? languageStar;
  String? userId;
  int? isActive;

  Languages(
      {this.idLanguage,
      this.languageName,
      this.languageStar,
      this.userId,
      this.isActive});

  Languages.fromJson(Map<String, dynamic> json) {
    idLanguage = json['id_language'];
    languageName = json['language_name'];
    languageStar = json['language_star'];
    userId = json['user_id'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_language'] = this.idLanguage;
    data['language_name'] = this.languageName;
    data['language_star'] = this.languageStar;
    data['user_id'] = this.userId;
    data['is_active'] = this.isActive;
    return data;
  }
}
