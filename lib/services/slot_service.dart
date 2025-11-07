import 'package:uuid/uuid.dart';
import '../models/slot.dart';

class SlotService {
  final _uuid = const Uuid();

  Future<List<Slot>> fetchSlots() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day, 9);
    return List.generate(8, (i) {
      final s = start.add(Duration(hours: i));
      return Slot(
        id: _uuid.v4(),
        startTime: s,
        endTime: s.add(const Duration(hours: 1)),
        isBooked: false,
      );
    });
  }
}
