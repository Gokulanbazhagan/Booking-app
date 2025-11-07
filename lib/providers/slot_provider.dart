import 'package:flutter/material.dart';
import '../models/slot.dart';
import '../services/slot_service.dart';

class SlotProvider extends ChangeNotifier {
  final SlotService _service = SlotService();
  List<Slot> _slots = [];
  bool _loading = false;
  String? _error;

  List<Slot> get slots => _slots;
  bool get loading => _loading;
  String? get error => _error;

  SlotProvider() {
    loadSlots();
  }

  Future<void> loadSlots() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _slots = await _service.fetchSlots();
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  void markBooked(String slotId) {
    final index = _slots.indexWhere((s) => s.id == slotId);
    if (index != -1) {
      _slots[index].isBooked = true;
      notifyListeners();
    }
  }
}
