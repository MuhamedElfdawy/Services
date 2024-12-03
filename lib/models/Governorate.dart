class GetGovernorateData {
  int? id;
  String? name;

  GetGovernorateData({this.id, this.name,});

  GetGovernorateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
