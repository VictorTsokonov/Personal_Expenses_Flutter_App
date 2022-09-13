import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Book', price: 20.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Game', price: 69.99, date: DateTime.now()),
  ];

  late String titleInput;
  late String priceInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          Card(
            child: Container(child: Text('Chart')),
          ),
          Card(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        onChanged: (value) => titleInput = value,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Price'),
                        onChanged: (value) => priceInput = value,
                      ),
                      TextButton(
                          child: Text('Send Transaction'),
                          onPressed: () {
                            print(titleInput);
                            print(priceInput);
                          },
                          style: TextButton.styleFrom(primary: Colors.purple))
                    ])),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 210, 23, 243),
                            width: 1)),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
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
          )
        ],
      ),
    );
  }
}
