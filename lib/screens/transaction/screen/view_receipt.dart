import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/transaction_model.dart';

class ViewrReceiptScreen extends StatelessWidget {
  final TransactionList transaction;

  const ViewrReceiptScreen({super.key,required this.transaction});

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
          title: const Text('Trip Receipt'),
        ),
        body: Column(
          children: [
            SizedBox(height: height * 0.002),
            Container(
              color: Colors.white,
              height: height * 0.09,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Trip start time',style: TextStyle(fontSize: 14,color: Colors.grey)),
                    Text("${transaction.date}, ${transaction.time}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.002),
            Container(
              color: Colors.white,
              height: height * 0.2,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                child: Column(
                  children: [
                    // SizedBox(height: height * 0.033),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Trip details',style: TextStyle(color: Colors.black54, fontSize: 16)),
                        SizedBox(height: height * 0.01),
                        Row(
                          children: [
                            const Icon(Icons.directions_bus,size: 26,color: Colors.black54),
                            Text("  ${transaction.route}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    SizedBox(
                      height: height * 0.07,
                      child: Row(
                        children: [
                          SizedBox(
                              height: height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: Image.asset('assets/downhill.png',fit: BoxFit.contain)
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(transaction.startStop,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),maxLines: 2,),
                              Text(transaction.endStop,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),maxLines: 2,)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.002),
            Container(
              color: Colors.white,
              height: height * 0.09,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Transaction amount',style: TextStyle(fontSize: 14,color: Colors.grey)),
                    Text('₹${transaction.amount}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.002),
            Container(
              color: Colors.white,
              height: height * 0.09,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Passenger details',style: TextStyle(fontSize: 14,color: Colors.grey)),
                    Text('${transaction.count} Adult',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.002),
            Container(
              color: Colors.white,
              height: height * 0.09,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Conductor ID',style: TextStyle(fontSize: 14,color: Colors.grey)),
                    Text('DIN1133109',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
            Image.asset('assets/ccc.png')
          ],
        ),
      ),
    );
  }
}
