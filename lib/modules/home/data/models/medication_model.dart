// models/medication_model.dart
class Medication {
  final String id;
  final String name;
  final String dosage;
  final String time;
  final int intakeDays;
  final int pauseDays;
  final String nextIntake;
  final bool isCyclic;

  Medication({
    required this.id,
    required this.name,
    required this.dosage,
    required this.time,
    required this.intakeDays,
    required this.pauseDays,
    required this.nextIntake,
    required this.isCyclic,
  });
}