import 'package:chalo/color.dart';
import 'package:chalo/screens/home_screen.dart';
import 'package:chalo/screens/transaction/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction/service/transaction_service.dart';

class TickedInfo extends StatefulWidget {

  final String route;
  final String startStop;
  final String endStop;

  TickedInfo({super.key, required this.route, required this.endStop, required this.startStop });

  @override
  State<TickedInfo> createState() => _TickedInfoState();
}

class _TickedInfoState extends State<TickedInfo> {

  int count = 1;
  double amount = 0.0;
  double paise = 0.00;
  double finalAmount = 0.0;
  double minusAmount = 0.15;

  void _add(){
    setState(() {
      count++;  //number of person
      finalAmount = finalAmount + paise; //Total amount
    });
  }

  void _substract(){
    if(count != 1){
      setState(() {
        count--;  //number of person
        finalAmount = finalAmount - paise;
      });
    }
  }



  void _saveTransaction() async {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Format the time and date
    String formattedTime = DateFormat('hh:mm a').format(now); // Format: 07:37 PM
    String formattedDate = DateFormat('dd MMM yyyy').format(now); // Format: 16 Jul 2024

    // Create a new transaction with the formatted date and time
    TransactionList newTransaction = TransactionList(
      title: 'Paid for ticket',
      amount: finalAmount.toString(), // You might want to update this as needed
      date: formattedDate,
      time: formattedTime,
      count: count,
      route: widget.route,
      startStop: widget.startStop,
      endStop: widget.endStop,
    );

    // Retrieve existing transactions, add the new one, and save them
    List<TransactionList> transactions = await TransactionService.getTransactions();
    transactions.add(newTransaction);
    await TransactionService.saveTransactions(transactions);

    // Optionally, show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Transaction saved')));
  }

  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          title: const Text('Select Tickets'),
          backgroundColor: Colors.transparent,
          actions: [
            PopupMenuButton<int>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey[50], // Set the icon color to red
              ),
              onSelected: (int value) {
                // Handle the selected value here
                setState(() {
                  if(value == 6){
                    paise = value.toDouble();
                    amount = value - 0.43 .toDouble();
                    finalAmount = value.toDouble();
                  }else if(value == 13){
                    paise = value.toDouble();
                    amount = 12.24;
                    finalAmount = value.toDouble();
                  }else if(value == 19){
                    paise = value.toDouble();
                    amount = 17.95;
                    finalAmount = value.toDouble();
                  } else{
                    paise = value.toDouble();
                    amount = value - minusAmount.toDouble();
                    finalAmount = value.toDouble();
                  }
                });
                print('Selected value: $value');
                // You can use this value to update your state or perform an action
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<int>(
                    value: 5,
                    child: Text('5'),
                  ),
                  const PopupMenuItem<int>(
                    value: 6,
                    child: Text('6'),
                  ),
                  const PopupMenuItem<int>(
                    value: 10,
                    child: Text('10'),
                  ),
                  const PopupMenuItem<int>(
                    value: 13,
                    child: Text('12'),
                  ),
                  const PopupMenuItem<int>(
                    value: 15,
                    child: Text('15'),
                  ),
                  const PopupMenuItem<int>(
                    value: 19,
                    child: Text('18'),
                  ),
                  const PopupMenuItem<int>(
                    value: 20,
                    child: Text('20'),
                  ),
                ];
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        SizedBox(height: h * 0.033),
                        Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Trip details',style: TextStyle(color: Colors.black54, fontSize: 16)),
                                Icon(Icons.keyboard_arrow_up_outlined,size: 23,color: Colors.black54)
                              ],
                            ),
                            SizedBox(height: h * 0.01),
                            Row(
                              children: [
                                const Icon(Icons.directions_bus,size: 30),
                                Text(" ${widget.route}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: h * 0.033),
                        SizedBox(
                          height: h * 0.07,
                          child: Row(
                            children: [
                              SizedBox(
                                height: h * 0.07,
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  child: Image.asset('assets/downhill.png',fit: BoxFit.contain)
                              ),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.startStop,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),maxLines: 2,),
                                  Text(widget.endStop,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),maxLines: 2,)
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height:  h * 0.02),
                  Container(
                    width: double.infinity,
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                      child: Text('Mobile Ticket',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey[600])),
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Adult',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                            Text(((amount)).toStringAsFixed(2),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                                onTap: _substract,
                                child: const Icon(Icons.remove_circle_outline,size: 35,color: Colors.black54)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text("$count",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                            ),
                            InkWell(
                                onTap: _add,
                                child: const Icon(Icons.add_circle_outline,size: 35,color: Colors.black54,))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:  h * 0.02),
                  Container(
                    height: h * 0.015,
                    width: double.infinity,
                    color: Colors.grey[100],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Adult $count X ₹${amount.toStringAsFixed(2)}",style: const TextStyle(color: Colors.black54, fontSize: 14)),
                            Text("₹${((amount * count)).toStringAsFixed(2)}",style: const TextStyle(color: Colors.black54, fontSize: 16)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Surcharge on Adult',style: TextStyle(color: Colors.black54, fontSize: 14)),
                              Text("₹${(minusAmount * count).toStringAsFixed(2)}",style: const TextStyle(color: Colors.black54, fontSize: 16)),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Amount',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                            Text("₹${(finalAmount).toStringAsFixed(1)}",style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: h * 0.2,
                    color: Colors.grey[100],
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                          child: Row(
                            children: [
                              Text('Non Refundable.',style: TextStyle(fontSize: 14, color: Colors.grey)),
                              Text(' Terms and Conditions',style: TextStyle(fontSize: 14, color: AppColors.deepOrange))
                            ],
                          ),
                        ),
                        Center(child: Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: Text('Ticket issued by BEST',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.black54),),
                        ),)
                      ],
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: (){
                  _saveTransaction();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                  print('paylonline button clikced');
                },
                child: Container(
                  height: h * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: AppColors.deepOrange,
                  ),
                  child: Center(
                    child: Text("PAY ₹${(finalAmount).toStringAsFixed(2)}",style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
