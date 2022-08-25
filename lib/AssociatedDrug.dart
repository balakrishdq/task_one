class AssociatedDrug {
  late String name;
  String? dose;
  late String strength;

  AssociatedDrug.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    dose = json['dose'];
    strength = json['strength'];
  }
}
