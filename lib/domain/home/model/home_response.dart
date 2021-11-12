class HomeResponse {
  bool success;
  List<Data> data;

  HomeResponse({this.success, this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
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
  String idUser;
  String username;
  String password;
  String email;
  String fullname;
  String birthday;
  String headline;
  String description;
  String dateCreated;
  String lastLogin;
  int isActive;
  List<Interests> interests;

  Data(
      {this.idUser,
      this.username,
      this.password,
      this.email,
      this.fullname,
      this.birthday,
      this.headline,
      this.description,
      this.dateCreated,
      this.lastLogin,
      this.isActive,
      this.interests});

  Data.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    fullname = json['fullname'];
    birthday = json['birthday'];
    headline = json['headline'];
    description = json['description'];
    dateCreated = json['date_created'];
    lastLogin = json['last_login'];
    isActive = json['is_active'];
    if (json['interests'] != null) {
      interests = new List<Interests>();
      json['interests'].forEach((v) {
        interests.add(new Interests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['birthday'] = this.birthday;
    data['headline'] = this.headline;
    data['description'] = this.description;
    data['date_created'] = this.dateCreated;
    data['last_login'] = this.lastLogin;
    data['is_active'] = this.isActive;
    if (this.interests != null) {
      data['interests'] = this.interests.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Interests {
  String idInterest;
  String interestName;
  String userId;

  Interests({this.idInterest, this.interestName, this.userId});

  Interests.fromJson(Map<String, dynamic> json) {
    idInterest = json['id_interest'];
    interestName = json['interest_name'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_interest'] = this.idInterest;
    data['interest_name'] = this.interestName;
    data['user_id'] = this.userId;
    return data;
  }
}
