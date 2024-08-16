import 'package:chalo/screens/circular_progress_indicator.dart';
import 'package:chalo/screens/Ticket_Book/payonline_ticket.dart';
import 'package:chalo/screens/transaction/screen/transaction_history_page.dart';
import 'package:flutter/material.dart';

class PayForTicket extends StatelessWidget {
  const PayForTicket({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/paymentScreen.png'),
                  fit: BoxFit.contain,
                )
              ),
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
              top: height * 0.01,
                right: width * 0.017,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> TransactionHistory()));
                    print('Wallet tapped');
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.15,
                    color: Colors.transparent,
                  ),
                ),
            ),
            Positioned(
              top: height * 0.01,
              left: width * 0.017,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  print('Back tapped');
                },
                child: Container(
                  height: height * 0.05,
                  width: width * 0.15,
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              top: height * 0.17,
              left: width * 0.04,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CircularProgressIndicatorScreen()));
                  print('pay using chalo pay');
                },
                child: Container(
                  height: height * 0.142,
                  width: width * 0.92,
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              top: height * 0.34,
              left: width * 0.04,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> payOnlinePage()));
                  print('Get ticket fare and pay online');
                },
                child: Container(
                  height: height * 0.142,
                  width: width * 0.92,
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
