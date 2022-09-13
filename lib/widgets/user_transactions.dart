import 'package:flutter/material.dart';

import '../widgets/transaction_list.dart';
import '../widgets/new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'New Book', price: 20.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Game', price: 69.99, date: DateTime.now()),
  ];

  void userTransactionHandler(Transaction newTransaction) {
    setState(() {
      _userTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(transactionHandler: userTransactionHandler),
        TransactionList(
          userTransactions: _userTransaction,
        ),
      ],
    );
  }
}