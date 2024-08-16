import 'package:chalo/color.dart';
import 'package:chalo/screens/Ticket_Book/ticket_info.dart';
import 'package:flutter/material.dart';


class payOnlinePage extends StatefulWidget {
  payOnlinePage({super.key});

  @override
  State<payOnlinePage> createState() => _payOnlinePageState();
}

class _payOnlinePageState extends State<payOnlinePage> {

  final TextEditingController routeController = TextEditingController();
  final TextEditingController startStopController = TextEditingController();
  final TextEditingController endStopController = TextEditingController();


  void _validateAndNavigate() {
    // Check if any of the text fields are empty
    if (routeController.text.isEmpty ||
        startStopController.text.isEmpty ||
        endStopController.text.isEmpty) {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the fields'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Navigate to the next page if all fields are filled
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TickedInfo(
            endStop: endStopController.text,
            route: routeController.text,
            startStop: startStopController.text,
          ),
        ),
      );
      print('payOnline button clicked');
    }
  }

  @override
  void dispose() {
    routeController.dispose();
    startStopController.dispose();
    endStopController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          title: const Text('Select Trip'),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(height: h * 0.04),
                TextField(
                  controller: routeController,
                  decoration: const InputDecoration(
                    hintText: 'Enter route number',
                    hintStyle: TextStyle(fontSize: 16,color: Colors.grey),
                    alignLabelWithHint: true,
                  ),
                ),
                SizedBox(height: h * 0.05),
                TextField(
                  controller: startStopController,
                  decoration: const InputDecoration(
                    hintText: 'Enter start stop',
                    hintStyle: TextStyle(fontSize: 16,color: Colors.grey),
                  ),
                ),
                SizedBox(height: h * 0.05),
                TextField(
                  controller: endStopController,
                  decoration: const InputDecoration(
                    hintText: 'Enter end stop',
                    hintStyle: TextStyle(fontSize: 16,color: Colors.grey),
                  ),
                ),
                SizedBox(height: h * 0.05),
                InkWell(
                  onTap: (){
                    _validateAndNavigate();
                  },
                  child: Container(
                    height: h * 0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.deepOrange,
                    ),
                    child: const Center(
                      child: Text('NEXT',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.06),
                const Text('Ticket issued by BEST',style: TextStyle(color: Colors.black54, fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
