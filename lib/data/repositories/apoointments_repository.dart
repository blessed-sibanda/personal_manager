import 'package:personal_manager/models/appointments_model.dart';

abstract class AppointmentsRepository {
  Future<List<Appointment>> findAllAppointments();
  Future<Appointment> findAppointmentById(int id);
  Stream<List<Appointment>> watchAllAppointments();
  Future<int> insertAppointment(Appointment appointment);
  Future<dynamic> updateAppointment(Appointment appointment);
  Future<void> deleteAppointment(Appointment appointment);
}
