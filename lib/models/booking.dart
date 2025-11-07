class Booking {
  final String id;
  final String slotId;
  final String userName;
  final String userEmail;
  final String paymentStatus;
  final DateTime bookedAt;

  Booking({
    required this.id,
    required this.slotId,
    required this.userName,
    required this.userEmail,
    required this.paymentStatus,
    required this.bookedAt,
  });
}
