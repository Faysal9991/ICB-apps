import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icbapps/helper/auth/auth.dart';
import 'package:icbapps/models/main_admin_model.dart';


class RechargeScreen extends StatefulWidget {
  const RechargeScreen({Key? key}) : super(key: key);

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  FireBase fireBase = FireBase();
  TextEditingController amount = TextEditingController();
  TextEditingController transactionId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Recharge"),
          bottom:  TabBar(tabs: [
              Tab(child: Text("Bkash", style: GoogleFonts.oleoScript(
                                                color: Colors.black)),),
              Tab(child: Text("Roket", style: GoogleFonts.oleoScript(
                                                color: Colors.black)),),
              Tab(child: Text("Nogod", style: GoogleFonts.oleoScript(
                                                color: Colors.black)),),
              Tab(child: Text("Binance", style: GoogleFonts.oleoScript(
                                                color: Colors.black)),),
              ]),
        ),
        body: TabBarView(children: [
        Container(height: 200,
        child: Column(
          children: [
            StreamBuilder<MainAdminModel>(
              stream: fireBase.mainadmindatas(),
              builder: (context, snapshot) {
                return snapshot.hasData?Text("Send Money to this number ${snapshot.data!.bkashnumber}"):CircularProgressIndicator();
    
              }
            ),
            TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "6 Doller pakage",
                border: OutlineInputBorder()
              ),
    
            ),
    
            TextField(
              controller: transactionId,
              decoration: InputDecoration(
                hintText: "input your transactionId",
                  border: OutlineInputBorder()
              ),
    
            ),
    
            TextButton(onPressed: (){
              fireBase.rechargeTobalance(amount.text.trim(), transactionId.text.trim()).then((value){
                print(value);
              });
    
            }, child: Text("Send request"))
    
          ],
        ),
        ),
        Container(height: 200,
        child: Column(
          children: [
            StreamBuilder<MainAdminModel>(
              stream: fireBase.mainadmindatas(),
              builder: (context, snapshot) {
                return snapshot.hasData?Text("Send Money to this number ${snapshot.data!.bkashnumber}"):CircularProgressIndicator();
    
              }
            ),
            TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "6 Doller pakage",
                border: OutlineInputBorder()
              ),
    
            ),
    
            TextField(
              controller: transactionId,
              decoration: InputDecoration(
                hintText: "input your transactionId",
                  border: OutlineInputBorder()
              ),
    
            ),
    
            TextButton(onPressed: (){
              fireBase.rechargeTobalance(amount.text.trim(), transactionId.text.trim()).then((value){
                print(value);
              });
    
            }, child: Text("Send request"))
    
          ],
        ),),
        Container(height: 200,
        child: Column(
          children: [
            StreamBuilder<MainAdminModel>(
              stream: fireBase.mainadmindatas(),
              builder: (context, snapshot) {
                return snapshot.hasData?Text("Send Money to this number ${snapshot.data!.bkashnumber}"):CircularProgressIndicator();
    
              }
            ),
            TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "6 Doller pakage",
                border: OutlineInputBorder()
              ),
    
            ),
    
            TextField(
              controller: transactionId,
              decoration: InputDecoration(
                hintText: "input your transactionId",
                  border: OutlineInputBorder()
              ),
    
            ),
    
            TextButton(onPressed: (){
              fireBase.rechargeTobalance(amount.text.trim(), transactionId.text.trim()).then((value){
                print(value);
              });
    
            }, child: Text("Send request"))
    
          ],
        ),
        ),Container(height: 200,
        child: Column(
          children: [
            StreamBuilder<MainAdminModel>(
              stream: fireBase.mainadmindatas(),
              builder: (context, snapshot) {
                return snapshot.hasData?Text("Binance acount : bc1q7x8xm62c2e9aa6s96h20086cl80y7er7up4k79"):CircularProgressIndicator();
    
              }
            ),
            TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "6 Doller pakage",
                border: OutlineInputBorder()
              ),
    
            ),
    
            TextField(
              controller: transactionId,
              decoration: InputDecoration(
                hintText: "input your transactionId",
                  border: OutlineInputBorder()
              ),
    
            ),
    
            TextButton(onPressed: (){
              fireBase.rechargeTobalance(amount.text.trim(), transactionId.text.trim()).then((value){
                print(value);
              });
    
            }, child: Text("Send request"))
    
          ],
        ),
        )
        
        
        
        ]),
      ),
    );
  }
}