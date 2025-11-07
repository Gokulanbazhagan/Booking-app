class Slot {
  final String id;
  final DateTime startTime;
  final DateTime endTime;
  bool isBooked;

  Slot({
    required this.id,
    required this.startTime,
    required this.endTime,
    this.isBooked = false,
  });

  Slot copyWith({bool? isBooked}) {
    return Slot(
      id: id,
      startTime: startTime,
      endTime: endTime,
      isBooked: isBooked ?? this.isBooked,
    );
  }
}
