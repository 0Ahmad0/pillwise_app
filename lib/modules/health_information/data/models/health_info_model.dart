import 'package:cloud_firestore/cloud_firestore.dart';

class HealthInfo {
  String? gender;
  DateTime? dateOfBirth;
  num? height;
  num? weight;
  bool isPregnant;
  bool isBreastfeeding;
  String currentMedications;

  HealthInfo({
    this.gender,
    this.dateOfBirth,
    this.height,
    this.weight,
    this.isPregnant = false,
    this.isBreastfeeding = false,
    this.currentMedications = '',
  });

  factory HealthInfo.fromJson( json){
    var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;
    return HealthInfo(
      gender: json['gender'],
      height: data['height'],
      weight: data['weight'],
      isPregnant: data['isPregnant']??false,
      isBreastfeeding: data['isBreastfeeding']??false,
      currentMedications: data['currentMedications']??'',

      dateOfBirth: (json["dateOfBirth"] is Timestamp)?json["dateOfBirth"].toDate():json["dateOfBirth"],
    );
  }

  Map<String,dynamic> toJson(){

    return {
      'gender':gender,
      'dateOfBirth':dateOfBirth,
      'height':height,
      'weight':weight,
      'isPregnant':isPregnant,
      'isBreastfeeding':isBreastfeeding,
      'currentMedications':currentMedications,
    };
  }
  factory HealthInfo.fromMap( data){
    return HealthInfo(
      gender: data['gender'],
      height: data['height'],
      weight: data['weight'],
      isPregnant: data['isPregnant']??false,
      isBreastfeeding: data['isBreastfeeding']??false,
      currentMedications: data['currentMedications']??'',

      dateOfBirth:data["dateOfBirth"]==null?null:DateTime.parse (data["dateOfBirth"]),
    );
  }
  Map<String,dynamic> toMap(){

    return {
      'gender':gender,
      'dateOfBirth':dateOfBirth?.toIso8601String(),
      'height':height,
      'weight':weight,
      'isPregnant':isPregnant,
      'isBreastfeeding':isBreastfeeding,
      'currentMedications':currentMedications,
    };
  }


  int? get age {
    if (dateOfBirth == null) return null;
    final now = DateTime.now();
    return now.year - dateOfBirth!.year;
  }

  double? get bmi {
    if (height == null || weight == null || height! <= 0) return null;
    final heightInMeters = height! / 100;
    return weight! / (heightInMeters * heightInMeters);
  }

  HealthInfo copyWith({
    String? gender,
    DateTime? dateOfBirth,
    double? height,
    double? weight,
    bool? isPregnant,
    bool? isBreastfeeding,
    String? currentMedications,
  }) {
    return HealthInfo(
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      isPregnant: isPregnant ?? this.isPregnant,
      isBreastfeeding: isBreastfeeding ?? this.isBreastfeeding,
      currentMedications: currentMedications ?? this.currentMedications,
    );
  }
}
