import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/slot.dart';

class SlotCard extends StatelessWidget {
  final Slot slot;
  final bool selected;
  final VoidCallback? onTap;

  const SlotCard({
    super.key,
    required this.slot,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final timeFmt = DateFormat.jm();
    final dateFmt = DateFormat('EEE, MMM d, yyyy'); // e.g., Tue, Nov 5, 2025
    final slotDate = dateFmt.format(slot.startTime);
    final timeRange =
        '${timeFmt.format(slot.startTime)} - ${timeFmt.format(slot.endTime)}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        onTap: slot.isBooked ? null : onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: selected ? Colors.teal.withOpacity(0.15) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? Colors.teal : Colors.grey.shade300,
              width: selected ? 1.8 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: ListTile(
            enabled: !slot.isBooked,
            title: Text(
              timeRange,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: slot.isBooked ? Colors.grey : Colors.teal.shade900,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              slotDate,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
            ),
            trailing: slot.isBooked
                ? const Chip(
                    label: Text(
                      'Booked',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.redAccent,
                  )
                : selected
                ? const Icon(Icons.check_circle, color: Colors.teal)
                : const Icon(Icons.schedule, color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
          ),
        ),
      ),
    );
  }
}
