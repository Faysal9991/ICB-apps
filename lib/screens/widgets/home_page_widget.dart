
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePageBox extends StatelessWidget {
   HomePageBox({
    Key? key,
     this.hight,
     this.width,
     this.iconSize,
     this.iconName,
     this.theicon,
    required this.goingScreen
  }) : super(key: key);

  final double? hight;
  final double? width;
  final double? iconSize;
  IconData ?theicon;
  String ?iconName;
  VoidCallback goingScreen;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: goingScreen,
      child: Container(
          height: hight,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [HexColor('#DC54FE'), HexColor('#8A02AE')],
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                theicon,
                color: Colors.green,
                size: iconSize,
              ),
              SizedBox(height: h*0.01,),
              Text(iconName!, style: GoogleFonts.oleoScript(color: Colors.white))
            ],
          )),
    );
  }
}
