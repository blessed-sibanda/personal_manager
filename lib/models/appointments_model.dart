class Appointment {
  Appointment({
    this.id,
    required this.title,
    required this.description,
    required this.apptTime,
  });

  int? id;
  String title;
  String description;
  DateTime apptTime;
}
