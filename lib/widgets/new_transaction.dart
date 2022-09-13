import 'package:flutter/material.dart';

import '../models/transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function transactionHandler;

  NewTransaction({super.key, required this.transactionHandler});
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: priceController,
            ),
            TextButton(
                child: Text('Send Transaction'),
                onPressed: () {
                  transactionHandler(Transaction(
                      id: 't56',
                      title: titleController.text.toString(),
                      price: double.parse(priceController.text.toString()),
                      date: DateTime.now()));
                },
                style: TextButton.styleFrom(primary: Colors.purple))
          ])),
    );
  }
}
