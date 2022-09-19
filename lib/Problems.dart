import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Problems {
  String problems;
  String diabetes;
  String medications;
  String medicationClasses;
  String className;
  AssociatedDrug associatedDrug;
  String labs;
  String asthma;

  Problems({
    required this.problems,
    required this.diabetes,
    required this.medications,
    required this.medicationClasses,
    required this.className,
    required this.associatedDrug,
    required this.labs,
    required this.asthma,
  });

  factory Problems.fromMap(Map<String, dynamic> json) {
    return Problems(
      problems: json['problems'] as String,
      diabetes: json['diabetes'] as String,
      medications: json['medications'] as String,
      medicationClasses: json['medicationClasses'] as String,
      className: json['className'] as String,
      associatedDrug: AssociatedDrug.fromJson(
          json['associatedDrug'] as Map<String, dynamic>),
      labs: json['labs'] as String,
      asthma: json['asthma'] as String,
    );
  }
}

class AssociatedDrug {
  String name;
  String dose;
  String strength;

  AssociatedDrug({
    required this.name,
    required this.dose,
    required this.strength,
  });

  factory AssociatedDrug.fromJson(Map<String, dynamic> json) {
    return AssociatedDrug(
      name: json['name'] as String,
      dose: json['dose'] as String,
      strength: json['strength'] as String,
    );
  }
}
