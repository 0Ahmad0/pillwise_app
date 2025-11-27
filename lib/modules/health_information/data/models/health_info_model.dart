class HealthInfo {
  String? gender;
  DateTime? dateOfBirth;
  double? height;
  double? weight;
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
