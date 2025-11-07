import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/slot_provider.dart';
import '../widgets/slot_card.dart';
import 'booking_confirmation_screen.dart';

class SlotSelectionScreen extends StatefulWidget {
  const SlotSelectionScreen({super.key});

  @override
  State<SlotSelectionScreen> createState() => _SlotSelectionScreenState();
}

class _SlotSelectionScreenState extends State<SlotSelectionScreen> {
  String? selectedSlotId;

  @override
  Widget build(BuildContext context) {
    final slotProvider = context.watch<SlotProvider>();

    if (slotProvider.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (slotProvider.error != null) {
      return Scaffold(
        body: Center(child: Text('Error: ${slotProvider.error}')),
      );
    }

    final slots = slotProvider.slots;

    return Scaffold(
      appBar: AppBar(title: const Text('Select a Slot')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: slots.length,
              itemBuilder: (context, i) {
                final slot = slots[i];
                return SlotCard(
                  slot: slot,
                  selected: selectedSlotId == slot.id,
                  onTap: () {
                    setState(() => selectedSlotId = slot.id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            BookingConfirmationScreen(selectedSlot: slot),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
