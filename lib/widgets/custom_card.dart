import 'package:chalo/color.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  final String text;
  final IconData icon;

  const CustomCard({super.key,required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Slight grey shadow
              spreadRadius: 1, // Spread of the shadow
              blurRadius: 3, // Blur radius of the shadow
              offset: const Offset(0, 1), // Position of the shadow
            ),
          ],
        ),
        height: height * 0.07,
        width: width * 0.42,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.iconColor,
                radius: 15,
                child: Icon(icon,color: Colors.white,size: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(text,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
