import 'package:personal_manager/data/moor/moor_db.dart';
import 'package:personal_manager/data/repositories/apoointments_repository.dart';
import 'package:personal_manager/models/appointments_model.dart';

class AppointmentsMoorRepository implements AppointmentsRepository {
  final _appointmentDao = PersonalManagerDatabase().appointmentDao;

  Stream<List<Appointment>>? appointmentsStream;

  @override
  Future<void> deleteAppointment(Appointment appointment) {
    return _appointmentDao.deleteAppointment(appointment.id!);
  }

  @override
  Future<List<Appointment>> findAllAppointments() {
    return _appointmentDao
        .findAllAppointments()
        .then((List<MoorAppointmentData> moorAppointments) {
      final appointments = <Appointment>[];
      for (var moorAppointment in moorAppointments) {
        final appointment = moorAppointmentToAppointment(moorAppointment);
        appointments.add(appointment);
      }
      return appointments;
    });
  }

  @override
  Future<Appointment> findAppointmentById(int id) {
    return _appointmentDao.findAppointmentById(id).then((listOfAppointments) =>
        moorAppointmentToAppointment(listOfAppointments.first));
  }

  @override
  Future<int> insertAppointment(Appointment appointment) {
    return _appointmentDao
        .insertAppointment(appointmentToInsertableMoorAppointment(appointment));
  }

  @override
  Future updateAppointment(Appointment appointment) {
    return _appointmentDao
        .updateAppointment(appointmentToInsertableMoorAppointment(appointment));
  }

  @override
  Stream<List<Appointment>> watchAllAppointments() {
    appointmentsStream ??= _appointmentDao.watchAllAppointments();
    return appointmentsStream!;
  }
}
