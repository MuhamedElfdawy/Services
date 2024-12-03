class GetUserData {
  String? id, firstName, lastName, displayName,
      userType, job, profilePicture,
      createdDate, city,
      email, phoneNumber;
  int? cityId;
  List? problems;


  GetUserData(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.displayName,
        this.job,
        this.profilePicture,
        this.createdDate,
        this.userType,
        this.cityId,
        this.problems});

  GetUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    displayName = json['displayName'];
    job = json['job'];
    profilePicture = json['profilePicture'];
    createdDate = json['createdDate'];
    userType = json['userType'];
    cityId = json['cityId'];
    if (json['problems'] != null) {
      problems = List.from(json['problems']).map((e) => ProblemsModel.fromjson(e)).toList();
    }
    }
  }

class ProblemsModel
{
  int? id;
  String ? name, description, type, problemImg;
  bool? status;

  ProblemsModel.fromjson(Map<String,dynamic> map){
    id = map['id'];
    name = map['name'];
    description = map['description'];
    type = map['type'];
    problemImg = map['problemImg'];
  }
}
