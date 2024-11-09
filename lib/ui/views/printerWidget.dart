// import 'package:esc_pos_printer/esc_pos_printer.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:flutter/material.dart';

// class PrintWidget extends StatefulWidget {
//   const PrintWidget({
//     super.key,
//     this.width,
//     this.height,
//     required this.orderNumber,
//     required this.ipAddress,
//     required this.port,
//   });

//   final double? width;
//   final double? height;
//   final int orderNumber;
//   final String ipAddress;
//   final String port;

//   @override
//   State<PrintWidget> createState() => _PrintWidgetState();
// }

// class _PrintWidgetState extends State<PrintWidget> {
//   List<bool> isBeverage = [];
//   List<String> pokeNames = [];
//   List<String> basicIngredients = [];
//   List<String> proteinIngredients = [];
//   List<String> condimentIngredients = [];
//   List<String> crunchyIngredients = [];
//   List<String> sauceIngredients = [];
//   List<String> pokeNotes = [];
//   List<String> dishChoice = [];
//   List<String> pokeSizes = [];
//   List<int> pokeQuantity = [];
//   List<String> timeChosen = [];
//   String pickupTime = '';
//   String paymentMethod = '';
//   String phoneNumber = '';
//   String totalPrice = '';
//   String selectedHour = '';
//   int tableNo = 0;
//   bool tableFlag = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadDummyData();
//   }

//   void _loadDummyData() {
//     isBeverage = [false, true];
//     pokeNames = ['Salmon Poke', 'Mango Smoothie'];
//     basicIngredients = ['Rice', ''];
//     proteinIngredients = ['Salmon', ''];
//     condimentIngredients = ['Avocado', ''];
//     crunchyIngredients = ['Sesame seeds', ''];
//     sauceIngredients = ['Soy Sauce', ''];
//     pokeNotes = ['Extra spicy', ''];
//     dishChoice = ['Yes', 'No'];
//     pokeSizes = ['Large', 'Small'];
//     pokeQuantity = [1, 2];
//     timeChosen = ['12:00 PM', '12:15 PM'];
//     pickupTime = '12:00 PM';
//     paymentMethod = 'Card';
//     phoneNumber = '1234567890';
//     totalPrice = '25.00';
//     selectedHour = '12:00 PM';
//     tableNo = 5;
//     tableFlag = true;

//     printOrder();
//     printOrderToConsole();
//   }

//   void printOrderToConsole() {
//     print("Order Number: ${widget.orderNumber}");
//     print("Payment Method: $paymentMethod");
//     if (phoneNumber.isNotEmpty) {
//       print("Phone Number: $phoneNumber");
//     }
//     print("Total Price: $totalPrice");
//     print("Selected Hour: $selectedHour");
//     print("-------------------------------------");
//     for (int i = 0; i < pokeNames.length; i++) {
//       if (isBeverage[i]) {
//         print("Bevanda: ${pokeNames[i]}");
//       } else {
//         print("Nome poke: ${pokeNames[i]}");
//         print("Quante poke: ${pokeQuantity[i]}");
//         print("Dimensione: ${pokeSizes[i]}");
//         print("Scelta posate: ${dishChoice[i]}");
//         print("Base: ${basicIngredients[i]}");
//         print("Proteine: ${proteinIngredients[i]}");
//         print("Condimenti: ${condimentIngredients[i]}");
//         print("Crunchy: ${crunchyIngredients[i]}");
//         print("Salse: ${sauceIngredients[i]}");
//         print("Note: ${pokeNotes[i]}");
//       }

//       print("-------------------------------------");
//     }
//   }

//   List<String> wrapText(String text, int lineWidth) {
//     List<String> lines = [];
//     while (text.length > lineWidth) {
//       int lastSpaceIndex = text.substring(0, lineWidth).lastIndexOf(' ');
//       if (lastSpaceIndex == -1) {
//         lastSpaceIndex = lineWidth;
//       }
//       lines.add(text.substring(0, lastSpaceIndex));
//       text = text.substring(lastSpaceIndex).trim();
//     }
//     if (text.isNotEmpty) {
//       lines.add(text);
//     }
//     return lines;
//   }

//   Future<void> printOrder() async {
//     final profile = await CapabilityProfile.load();
//     final printer = NetworkPrinter(PaperSize.mm80, profile);
//     print("order number: ${widget.orderNumber}");
//     final posPrintResult =
//         await printer.connect(widget.ipAddress, port: int.parse(widget.port));

//     if (posPrintResult == PosPrintResult.success) {
//       List<String> lines;
//       if (tableFlag) {
//         lines = wrapText('Tavolo: $tableNo', 48);
//         for (String line in lines) {
//           printer.text(
//             line,
//             styles: const PosStyles(
//               align: PosAlign.left,
//               height: PosTextSize.size2,
//               width: PosTextSize.size2,
//               bold: true,
//             ),
//             linesAfter: 1,
//           );
//         }
//       }

//       lines = wrapText('Numero ordine: ${widget.orderNumber}', 48);
//       for (String line in lines) {
//         printer.text(
//           line,
//           styles: const PosStyles(
//             align: PosAlign.left,
//             height: PosTextSize.size2,
//             width: PosTextSize.size2,
//             bold: true,
//           ),
//           linesAfter: 1,
//         );
//       }

//       lines = wrapText('Metodo di pagamento: $paymentMethod', 48);
//       for (String line in lines) {
//         printer.text(
//           line,
//           styles: _getStyle('Base'),
//           linesAfter: 1,
//         );
//       }

//       if (phoneNumber.isNotEmpty) {
//         lines = wrapText('Numero di telefono: $phoneNumber', 48);
//         for (String line in lines) {
//           printer.text(
//             line,
//             styles: _getStyle('Base'),
//             linesAfter: 1,
//           );
//         }
//       }

//       lines = wrapText('Prezzo: \x1B\x74\x13\xD5 $totalPrice', 48);
//       for (String line in lines) {
//         printer.text(
//           line,
//           styles: _getStyle('Base'),
//           linesAfter: 1,
//         );
//       }

//       lines = wrapText('Orario scelto: $selectedHour', 48);
//       for (String line in lines) {
//         printer.text(
//           line,
//           styles: _getStyle('Base'),
//           linesAfter: 1,
//         );
//       }

//       lines = wrapText('-------------------------------------', 48);
//       for (String line in lines) {
//         printer.text(
//           line,
//           styles: const PosStyles(
//             align: PosAlign.left,
//             height: PosTextSize.size1,
//             width: PosTextSize.size1,
//           ),
//           linesAfter: 1,
//         );
//       }

//       for (int i = 0; i < pokeNames.length; i++) {
//         if (isBeverage[i]) {
//           lines = wrapText('Bevanda: ${pokeNames[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: _getStyle('Nome poke'),
//               linesAfter: 1,
//             );
//           }

//           lines = wrapText('Quantita: ${pokeQuantity[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: _getStyle('Quante poke'),
//               linesAfter: 1,
//             );
//           }
//         } else {
//           lines = wrapText('Nome poke: ${pokeNames[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: _getStyle('Nome poke'),
//               linesAfter: 1,
//             );
//           }

//           lines = wrapText('Quantita: ${pokeQuantity[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: _getStyle('Quante poke'),
//               linesAfter: 1,
//             );
//           }

//           lines = wrapText('Dimensione: ${pokeSizes[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: _getStyle('Dimensione'),
//               linesAfter: 1,
//             );
//           }

//           lines = wrapText('Scelta posate: ${dishChoice[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: const PosStyles(
//                 align: PosAlign.left,
//                 height: PosTextSize.size1,
//                 width: PosTextSize.size1,
//               ),
//               linesAfter: 1,
//             );
//           }

//           lines = wrapText('Base: ${basicIngredients[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: _getStyle('Base'),
//               linesAfter: 1,
//             );
//           }

//           lines = wrapText('Proteine: ${proteinIngredients[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: _getStyle('Proteine'),
//               linesAfter: 1,
//             );
//           }

//           lines = wrapText('Condimenti: ${condimentIngredients[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: _getStyle('Condimenti'),
//               linesAfter: 1,
//             );
//           }

//           lines = wrapText('Crunchy: ${crunchyIngredients[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: _getStyle('Crunchy'),
//               linesAfter: 1,
//             );
//           }

//           lines = wrapText('Salse: ${sauceIngredients[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: _getStyle('Salse'),
//               linesAfter: 1,
//             );
//           }

//           lines = wrapText('Note: ${pokeNotes[i]}', 48);
//           for (String line in lines) {
//             printer.text(
//               line,
//               styles: _getStyle('Note'),
//               linesAfter: 1,
//             );
//           }
//         }

//         lines = wrapText('-------------------------------------', 48);
//         for (String line in lines) {
//           printer.text(
//             line,
//             styles: const PosStyles(
//               align: PosAlign.left,
//               height: PosTextSize.size1,
//               width: PosTextSize.size1,
//             ),
//             linesAfter: 1,
//           );
//         }
//       }

//       printer.feed(2);
//       printer.cut();
//       printer.disconnect();
//     } else {
//       print("Printer connection failed: ${posPrintResult.msg}");
//     }
//   }

//   PosStyles _getStyle(String fieldName) {
//     return const PosStyles(
//       align: PosAlign.left,
//       height: PosTextSize.size1,
//       width: PosTextSize.size1,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.width,
//       height: widget.height,
//       decoration: BoxDecoration(
//         color: Colors.pink,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: ElevatedButton(
//         onPressed: printOrder,
//         child: const Text('hit me daddy'),
//       ),
//     );
//   }
// }
