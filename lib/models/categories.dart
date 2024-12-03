class GetCategoriesSlider
{
  int? id;
  String? name;
  String? catImage;
  List<ProblemsModel>? problems;

  GetCategoriesSlider({this.id, this.name, this.catImage, this.problems});

  GetCategoriesSlider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    catImage = json['imagePath'];
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