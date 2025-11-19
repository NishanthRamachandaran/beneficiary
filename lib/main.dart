// lib/main.dart
import 'package:flutter/material.dart';
import 'package:beneficiary/features/transaction_popup/presentation/widgets/transaction_detail_popup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tx = TransactionDetail(
      amount: "+23,489.28 QAR",
      date: "23/11/2025, 23:07 PM",
      referenceNumber: "ABCDE12345",
      beneficiaryName: "Sara Rahman",
      bankAndAccount: "Doha Bank\nAccount No: 1234567890",
      currency: "QAR",
      status: "Success",
      channel: "Mobile Banking",
      swiftReference: "SW12345678",
      description: 
        'RIB: TFR to firstname LMOQP firstname LMOQP\n'
        'firstname LMOQP RIB RIB: TFR to firstname LMOQP\n'
        'firstname LMOQP RIB',
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          // Open popup immediately
          Future.microtask(() {
            showDialog(
              context: context,
              builder: (_) => TransactionDetailPopup(transaction: tx),
            );
          });

          return const Scaffold(
            backgroundColor: Colors.white,
          );
        },
      ),
    );
  }
}
