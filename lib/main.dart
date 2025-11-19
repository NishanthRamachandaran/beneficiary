// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/beneficiaries/presentation/pages/beneficiaries_screen.dart';

void main() {
  runApp(
    const ProviderScope(       // ✅ MUST wrap the whole app
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BeneficiariesScreen(),   // your screen
    );
  }
}
