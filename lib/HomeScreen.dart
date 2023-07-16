import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/SmartDeviceBox.dart';

class HomeScreen  extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key) ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List mySmartDevices = [
    ["Smart Light", "assets/Icons/light.png",true],
    ["Smart AC", "assets/Icons/ac.png",true],
    ["Smart TV", "assets/Icons/tv.png",true],
    ["Smart Fan", "assets/Icons/fan.png",true],
  ];

  void powerSwitchChanged(bool value, int index){
    setState(() {
      mySmartDevices[index][2]=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Padding(

              padding:  EdgeInsets.symmetric(horizontal: 40,vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/Icons/menu.png",
                  height: 35,
                  color: Colors.grey[800],
                  ),
                  Icon(Icons.person,size: 35, color: Colors.grey[800],),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
              child: Column(
                children: [
                  Text("Welcome",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade800
                  ),),
                  Text("Smart Home",style: GoogleFonts.bebasNeue(fontSize: 72),)
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Smart Devices", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.grey.shade800,
            ),),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1.3,
              ),
              itemCount: mySmartDevices.length,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25,),
              itemBuilder: (context , index){
                return SmartDeviceBox(
                  SmartDeviceName : mySmartDevices[index][0],
                  iconPath : mySmartDevices[index][1],
                  powerOn : mySmartDevices[index][2],
                  onCharged: (value)=> powerSwitchChanged(value, index),
                  
                );
              },),
            )
          ],
        ),
      ),
    );
    
  }
}
