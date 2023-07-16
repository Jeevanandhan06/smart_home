import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  late String SmartDeviceName;
  late String iconPath;
  late bool powerOn;
  void Function(bool)? onCharged;

  SmartDeviceBox(
  {
    super.key,
    required this.SmartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onCharged,
}

      );


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: powerOn ?Colors.grey[900]:Color.fromARGB(44, 164, 167, 189)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconPath,
                height: 65,
                color: powerOn ? Colors.white : Colors.grey.shade700,
              ),
              Row(
                children: [
                  Expanded(child:Text(SmartDeviceName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: powerOn?Colors.white:Colors.black,

                    ),
                  )),
                  Transform.rotate(angle: pi/2,
                  child: CupertinoSwitch(
                    value: powerOn,
                    onChanged: onCharged,
                  ),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


