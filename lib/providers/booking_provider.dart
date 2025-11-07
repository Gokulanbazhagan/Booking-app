import 'package:flutter/material.dart';
import '../models/booking.dart';
import '../services/booking_service.dart';
import 'slot_provider.dart';

class BookingProvider extends ChangeNotifier {
  final BookingService _service = BookingService();
  final List<Booking> _bookings = [];

  List<Booking> get bookings => _bookings;

  Future<Booking?> createBooking({
    required String slotId,
    required String userName,
    required String userEmail,
    required String paymentStatus,
    required SlotProvider slotProvider,
  }) async {
    try {
      final booking = await _service.createBooking(
        slotId: slotId,
        userName: userName,
        userEmail: userEmail,
        paymentStatus: paymentStatus,
      );
      _bookings.add(booking);
      slotProvider.markBooked(slotId);
      notifyListeners();
      return booking;
    } catch (_) {
      return null;
    }
  }
}
