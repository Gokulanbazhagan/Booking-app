import 'package:uuid/uuid.dart';
import '../models/booking.dart';

class BookingService {
  final _uuid = const Uuid();

  Future<Booking> createBooking({
    required String slotId,
    required String userName,
    required String userEmail,
    required String paymentStatus,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Booking(
      id: _uuid.v4(),
      slotId: slotId,
      userName: userName,
      userEmail: userEmail,
      paymentStatus: paymentStatus,
      bookedAt: DateTime.now(),
    );
  }
}
