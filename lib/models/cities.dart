class GetCitiesData {
  int? id;
  String? name;

  GetCitiesData({this.id, this.name,});

  GetCitiesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
