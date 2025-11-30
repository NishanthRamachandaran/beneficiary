// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/legacy.dart';

// import '../../../../core/constants/colors.dart';

// class TransactionDetail {
//   final String amount;
//   final String date;
//   final String referenceNumber;
//   final String beneficiaryName;
//   final String bankAndAccount;
//   final String currency;
//   final String status;
//   final String channel;
//   final String swiftReference;
//   final String description;

//   TransactionDetail({
//     required this.amount,
//     required this.date,
//     required this.referenceNumber,
//     required this.beneficiaryName,
//     required this.bankAndAccount,
//     required this.currency,
//     required this.status,
//     required this.channel,
//     required this.swiftReference,
//     required this.description,
//   });
// }


// ///  POPUP WIDGET

// class TransactionDetailPopup extends StatelessWidget {
//   final TransactionDetail transaction;

//   const TransactionDetailPopup({super.key, required this.transaction});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       insetPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
//       backgroundColor: DefaultColors.white,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: _PopupBody(transaction: transaction),
//       ),
//     );
//   }
// }


// ///  POPUP BODY 

// class _PopupBody extends StatelessWidget {
//   final TransactionDetail transaction;

//   const _PopupBody({required this.transaction});

//   Widget _row(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 4,
//             child: Text(
//               label,
//               style: const TextStyle(
//                 fontFamily: 'DiodrumArabic',
//                 fontSize: 13,
//                 color: DefaultColors.gray82,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 6,
//             child: Text(
//               value,
//               textAlign: TextAlign.right,
//               style: const TextStyle(
//                 fontFamily: 'DiodrumArabic',
//                 fontSize: 13.5,
//                 color: DefaultColors.black,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.82,
//       child: Column(
//         children: [
//           // AMOUNT ROW
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Amount",
//                   style: TextStyle(
//                     fontFamily: 'DiodrumArabic',
//                     color: DefaultColors.gray82,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   transaction.amount,
//                   style: const TextStyle(
//                     fontFamily: 'DiodrumArabic',
//                     color: DefaultColors.green54,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // DETAILS BOX
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: DefaultColors.blue_100),
//                     borderRadius: BorderRadius.circular(12),
//                     color: DefaultColors.white,
//                   ),
//                   child: Column(
//                     children: [
//                       _row("Date", transaction.date),
//                       const Divider(height: 1, color: DefaultColors.blue_100),
//                       _row("Reference number", transaction.referenceNumber),
//                       const Divider(height: 1, color: DefaultColors.blue_100),
//                       _row("Beneficiary Name", transaction.beneficiaryName),
//                       const Divider(height: 1, color: DefaultColors.blue_100),
//                       _row("Bank Name / Account Number / IBAN",
//                           transaction.bankAndAccount),
//                       const Divider(height: 1, color: DefaultColors.blue_100),
//                       _row("Currency", transaction.currency),
//                       const Divider(height: 1, color: DefaultColors.blue_100),
//                       _row("Status", transaction.status),
//                       const Divider(height: 1, color: DefaultColors.blue_100),
//                       _row("Channel ID", transaction.channel),
//                       const Divider(height: 1, color: DefaultColors.blue_100),
//                       _row("Swift / Transaction Reference",
//                           transaction.swiftReference),
//                       const Divider(height: 1, color: DefaultColors.blue_100),

//                       // DESCRIPTION
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 14, horizontal: 14),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Expanded(
//                               flex: 4,
//                               child: Text(
//                                 "Description",
//                                 style: TextStyle(
//                                   fontFamily: 'DiodrumArabic',
//                                   fontSize: 13,
//                                   color: DefaultColors.gray82,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 6,
//                               child: Text(
//                                 transaction.description,
//                                 maxLines: 3,
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.right,
//                                 style: const TextStyle(
//                                   fontFamily: 'DiodrumArabic',
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                   color: DefaultColors.black,
//                                   height: 1.35,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
