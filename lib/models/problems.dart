class GetPostsData {
  int? id;
  String? name;
  String? imagePath;
  List<Problems>? problems;

  GetPostsData(
      {this.id, this.name, this.imagePath, this.problems});

  GetPostsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath = json['imagePath'];
    problems = List<Problems>.from((json['problems']).map((e) => Problems.fromJson(e))).toList();
  }
}

class Problems {
  int? id;
  String? description;
  bool? status;
  String? problemImg;
  String? createdDate;
  int? categoryId;
  User? user;

  Problems(
      {this.id,
        this.description,
        this.status,
        this.problemImg,
        this.createdDate,
        this.categoryId,
        this.user,
       });

  Problems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    status = json['status'];
    problemImg = json['problemImg'];
    createdDate = json['createdDate'];
    categoryId = json['categoryId'];
    user = json['user'] !=null ? User.fromJson(json['user']) : null;
  }
}

class User {
  String? id;
  String? displayName;
  String? profilePicture;
  String? phoneNumber;

  User(
      {this.id,
        this.displayName,
        this.profilePicture,
        this.phoneNumber,
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    profilePicture = json['profilePicture'];
    phoneNumber = json['phoneNumber'];
  }
}
