import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList({super.key, required this.userTransactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransactions.map((tx) {
        return Card(
          child: Row(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 210, 23, 243), width: 1)),
              child: Text('\$${tx.price}',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 210, 23, 243),
                      fontWeight: FontWeight.bold)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  DateFormat.yMMMd().format(tx.date),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ]),
        );
      }).toList(),
    );
  }
}
