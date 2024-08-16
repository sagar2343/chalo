import 'package:chalo/color.dart';
import 'package:chalo/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'circular_progress_indicator.dart';
import 'Ticket_Book/pay__for_ticket.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ///  top appbar with search  ///
              Stack(
                children: [
                  ///  AppBar   ///
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    height: height * 0.13,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0,left: 12.0,top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person),
                            ),
                          ),
                          Image.asset('assets/chaloLogo.png',width: width * 0.4),
                           SizedBox(width: width * 0.1),
                        ]
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,left: 20.0,top: 70.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // Slight grey shadow
                            spreadRadius: 1, // Spread of the shadow
                            blurRadius: 3, // Blur radius of the shadow
                            offset: const Offset(0, 2), // Position of the shadow
                          ),
                        ],
                      ),
                      height: height * 0.06,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter destination or Bus number',
                          hintStyle: const TextStyle(fontWeight: FontWeight.w500),
                          prefixIcon: const Icon(Icons.search, color: AppColors.secondaryColor),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              ///  Card View   ///
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CircularProgressIndicatorScreen()));
                          },
                          child: Card(
                            elevation: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3), // Slight grey shadow
                                    spreadRadius: 1, // Spread of the shadow
                                    blurRadius: 3, // Blur radius of the shadow
                                    offset: const Offset(0, 2), // Position of the shadow
                                  ),
                                ],
                              ),
                              height: height * 0.23,
                              width: width * 0.42,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0,left: 15.0, right: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Buy ticket/ pass',style: GoogleFonts.lato(fontSize: 14)),
                                    Row(
                                      children: [
                                        Text('for ',style: GoogleFonts.lato(fontSize: 14)),
                                        Text('Chalo Bus',style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.lightorangeColor,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text('Luxury AC Bus',style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.secondaryColor)),
                                        ),
                                    ),
                                    Image.asset('assets/luxuryBus.png',height: height * 0.11,fit: BoxFit.fill),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CircularProgressIndicatorScreen()));
                          },
                          child: Card(
                            elevation: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3), // Slight grey shadow
                                    spreadRadius: 1, // Spread of the shadow
                                    blurRadius: 3, // Blur radius of the shadow
                                    offset: const Offset(0, 2), // Position of the shadow
                                  ),
                                ],
                              ),
                              height: height * 0.23,
                              width: width * 0.42,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0,left: 15.0, right: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Recharge',style: GoogleFonts.lato(fontSize: 14)),
                                    Row(
                                      children: [
                                        Text('Chalo Card',style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.lightorangeColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text('Easy Payment',style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.secondaryColor)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0,left: 15.0),
                                      child: Image.asset('assets/chaloCard.png',height: height * 0.07,fit: BoxFit.fill),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Divider(color: Colors.grey[100],thickness: 3),
              SizedBox(height: height * 0.01),
              ///  Recent bus track Card ///
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CircularProgressIndicatorScreen()));
                        },
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3), // Slight grey shadow
                                  spreadRadius: 1, // Spread of the shadow
                                  blurRadius: 3, // Blur radius of the shadow
                                  offset: const Offset(0, 2), // Position of the shadow
                                ),
                              ],
                            ),
                            height: height * 0.1,
                            width: width * 0.5,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.directions_bus_sharp,color: Colors.black45,size: 20),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('282',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                      Text('To Damu nagar...',maxLines: 1,overflow: TextOverflow.ellipsis)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CircularProgressIndicatorScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3), // Slight grey shadow
                                    spreadRadius: 1, // Spread of the shadow
                                    blurRadius: 3, // Blur radius of the shadow
                                    offset: const Offset(0, 2), // Position of the shadow
                                  ),
                                ],
                              ),
                              height: height * 0.1,
                              width: width * 0.5,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.directions_bus_sharp,color: Colors.black45,size: 20),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('288',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        Text('To Kandivali n...',maxLines: 1,overflow: TextOverflow.ellipsis)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CircularProgressIndicatorScreen()));
                        },
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3), // Slight grey shadow
                                  spreadRadius: 1, // Spread of the shadow
                                  blurRadius: 3, // Blur radius of the shadow
                                  offset: const Offset(0, 2), // Position of the shadow
                                ),
                              ],
                            ),
                            height: height * 0.1,
                            width: width * 0.5,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.directions_bus_sharp,color: Colors.black45,size: 20),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('282',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                      Text('To Damu nagar...',maxLines: 1,overflow: TextOverflow.ellipsis)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Divider(color: Colors.grey[100],thickness: 10),
              SizedBox(height: height * 0.02),
              ///  Banner  ///
              SizedBox(
                height: height * 0.33,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Buy mobile ticket/ pass',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const CircularProgressIndicatorScreen()));
                              },
                              child: const Text('See All',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.secondaryColor)))
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CircularProgressIndicatorScreen()));
                      },
                      child: SizedBox(
                        width: double.infinity,
                          child: Image.asset('assets/banner.png',fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
              ),
              /// Ticket Cards ///
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const CircularProgressIndicatorScreen()));
                        },
                        child: const CustomCard(text: 'Bus pass', icon: Icons.directions_bus_sharp)),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const PayForTicket()));
                        },
                        child: const CustomCard(text: 'Pay for ticket', icon: Icons.airplane_ticket_rounded))
                  ],
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(top: 5.0),
                 child: Divider(color: Colors.grey[100],thickness: 2),
               ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Your Chalo Card',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Buy Card',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.secondaryColor))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCard(text: 'View Balance', icon: Icons.info),
                    CustomCard(text: 'Recharge Card', icon: Icons.airplane_ticket_rounded)
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Divider(color: Colors.grey[100],thickness: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Nearest bus stop',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CircularProgressIndicatorScreen()));
                        },
                        child: const Text('See all',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.secondaryColor)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CircularProgressIndicatorScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3), // Slight grey shadow
                          spreadRadius: 1, // Spread of the shadow
                          blurRadius: 3, // Blur radius of the shadow
                          offset: const Offset(0, 2), // Position of the shadow
                        ),
                      ],
                    ),
                    height: height * 0.4,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Image.asset('assets/nearestBusImg.png'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Center(
                              child:Text('See All buses',style: GoogleFonts.poppins(fontSize: 16,color: AppColors.secondaryColor,fontWeight: FontWeight.w500),),
                            ),
                          )
                        ],
                      ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Buses around you',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Slight grey shadow
                          spreadRadius: 1, // Spread of the shadow
                          blurRadius: 3, // Blur radius of the shadow
                          offset: const Offset(0, 2), // Position of the shadow
                        ),
                      ],
                    ),
                  height: height * 0.234,
                    width: double.infinity,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CircularProgressIndicatorScreen()));
                        },
                        child: Image.asset('assets/map.png'))
                ),
              ),
              SizedBox(height: height * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Slight grey shadow
                          spreadRadius: 1, // Spread of the shadow
                          blurRadius: 3, // Blur radius of the shadow
                          offset: const Offset(0, 2), // Position of the shadow
                        ),
                      ],
                    ),
                    height: height * 0.14,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Make your every day travel better\non BEST buses',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CircularProgressIndicatorScreen()));
                                  },
                                  child: const Text('Learm More',style: TextStyle(color: AppColors.secondaryColor,fontWeight: FontWeight.bold,fontSize: 12)))
                            ],
                          ),
                          Image.asset('assets/best.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
