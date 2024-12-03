class GetFactorData {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? displayName;
  Job? job;
  String? profilePicture;
  String? createdDate;
  String? userType;
  int? cityId;

  GetFactorData({
    this.id,
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
  });

  GetFactorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    displayName = json['displayName'];
    job = json['job'] != null ? Job.fromJson(json['job']) : null;
    profilePicture = json['profilePicture'];
    createdDate = json['createdDate'];
    userType = json['userType'];
    cityId = json['cityId'];
  }
}

class Job {
  int? id;
  String? name;
  String? imagePath;

  Job({this.id, this.name, this.imagePath});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath = json['imagePath'];
  }
}
