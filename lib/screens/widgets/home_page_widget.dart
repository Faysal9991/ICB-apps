
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePageBox extends StatelessWidget {
   HomePageBox({
    Key? key,
    required this.h,
    required this.w,
    required this.iconName,
    required this.theicon,
    required this.goingScreen
  }) : super(key: key);

  final double h;
  final double w;
  IconData theicon;
  String iconName;
  VoidCallback goingScreen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: goingScreen,
      child: Container(
          height: h * 0.17,
          width: w / 3,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [HexColor('#DC54FE'), HexColor('#8A02AE')],
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                theicon,
                color: Colors.green,
                size: h * 0.06,
              ),
              SizedBox(height: h*0.01,),
              Text(iconName, style: GoogleFonts.oleoScript(color: Colors.white))
            ],
          )),
    );
  }
}
