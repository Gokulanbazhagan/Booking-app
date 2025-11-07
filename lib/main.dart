import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/slot_provider.dart';
import 'providers/booking_provider.dart';
import 'screens/slot_selection_screen.dart';

void main() {
  runApp(const SlotBookingApp());
}

class SlotBookingApp extends StatelessWidget {
  const SlotBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SlotProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
      ],
      child: MaterialApp(
        title: 'Slot Booking Task',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const SlotSelectionScreen(),
      ),
    );
  }
}
