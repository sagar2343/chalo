import 'package:chalo/screens/transaction/screen/view_receipt.dart';
import 'package:flutter/material.dart';

import '../models/transaction_model.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final TransactionList transaction;

  const TransactionDetailsScreen({super.key,required this.transaction});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    int amountAsInt = (double.tryParse(transaction.amount) ?? 0).toInt();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          actions: [
            GestureDetector(
              onTap: (){
                print('view receipt tapped///');
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewrReceiptScreen(transaction: transaction)));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('VIEW RECEIPT',style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w500)),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0,bottom: 8.0),
                child: SizedBox(
                  height: height * 0.08,
                    child: Image.asset('assets/walletTick.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text('₹$amountAsInt',style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 23)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${transaction.time}, ', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black54)),
                Text(transaction.date, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black54)),
              ],
            ),
            SizedBox(height: height * 0.02),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Slight grey shadow
                    spreadRadius: 0.5, // Spread of the shadow
                    blurRadius: 2, // Blur radius of the shadow
                    offset: const Offset(0, 0), // Position of the shadow
                  ),
                ],
              ),
              height: height * 0.115,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Booking id',style: TextStyle(fontSize: 16, color: Colors.black54)),
                        Text('cp_1721139755000',style: TextStyle(fontSize: 16, color: Colors.black54)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Transaction Status',style: TextStyle(fontSize: 16, color: Colors.black54)),
                        Text('Success',style: TextStyle(fontSize: 16, color: Colors.black54)),
                      ],
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 60.0,bottom: 25),
              child: Image.asset('assets/bnk.png',width: 200),
            ),
          ],
        ),
      ),
    );
  }
}
