import 'package:chalo/screens/transaction/models/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TransactionService {

  static Future<void> saveTransactions(List<TransactionList> transactions) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> transactionList = transactions.map((transaction) => jsonEncode(transaction.toMap())).toList();
    await prefs.setStringList('transactions', transactionList);
  }

  static Future<List<TransactionList>> getTransactions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? transactionList = prefs.getStringList('transactions');
    if (transactionList != null) {
      return transactionList.map((transaction) => TransactionList.fromMap(jsonDecode(transaction))).toList();
    }
    return [];
  }
}
