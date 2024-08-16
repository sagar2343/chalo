import 'package:chalo/color.dart';
import 'package:chalo/screens/transaction/models/transaction_model.dart';
import 'package:chalo/screens/transaction/service/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Transaction_Details_Screen.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0,bottom: 10),
                      child: Text('Balance',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('₹16',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w500)),
                        Container(
                          height: height * 0.065,
                          width: width * 0.42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.secondaryColor)
                          ),
                          child: const Center(child: Text('RECHARGE WALLET',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700,color: AppColors.secondaryColor))),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey[100],height: 40,thickness: 7),
              SizedBox(height: height * 0.01),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('My Transactions',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
                        Text('SEE ALL',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: AppColors.secondaryColor),)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              FutureBuilder<List<TransactionList>>(
                future: TransactionService.getTransactions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No transactions found'));
                  } else {
                    List<TransactionList> transactions = snapshot.data!;

                    // Define the date format to parse the date and time strings
                    final DateFormat dateFormat = DateFormat("dd MMM yyyy hh:mm a");

                    // Sort the transactions by date and time
                    transactions.sort((a, b) {
                      try {
                        DateTime dateTimeA = dateFormat.parse('${a.date} ${a.time}');
                        DateTime dateTimeB = dateFormat.parse('${b.date} ${b.time}');
                        return dateTimeB.compareTo(dateTimeA); // Descending order
                      } catch (e) {
                        // Handle any parsing errors (optional)
                        return 0;
                      }
                    });

                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        TransactionList transaction = transactions[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> TransactionDetailsScreen(transaction: transaction)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                            child: Card(
                              elevation: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2), // Slight grey shadow
                                      spreadRadius: 0.5, // Spread of the shadow
                                      blurRadius: 2, // Blur radius of the shadow
                                      offset: const Offset(0, 1), // Position of the shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: height * 0.1,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(transaction.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                          Text('₹${transaction.amount}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: transaction.title == 'Money added' ? Colors.green : Colors.black))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('${transaction.time}, ', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black54)),
                                          Text(transaction.date, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black54))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0,bottom: 25),
                child: Image.asset('assets/bnk.png',width: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



