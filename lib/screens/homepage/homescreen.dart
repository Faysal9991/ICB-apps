import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:glass/glass.dart';
import 'package:icbapps/daily_work.dart';
import 'package:icbapps/helper/auth/auth.dart';
import 'package:icbapps/history.dart';
import 'package:icbapps/models/ModelUser.dart';
import 'package:icbapps/models/admin.dart';
import 'package:icbapps/recharge.dart';
import 'package:icbapps/screens/loginorsignup/loginorsignup.dart';
import 'package:icbapps/screens/registerpage/registerscreen.dart';
import 'package:icbapps/screens/widgets/header_widget.dart';
import 'package:icbapps/screens/widgets/home_page_widget.dart';
import 'package:icbapps/screens/withdraw/withdraw_screen.dart';
import 'package:icbapps/whats_report.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FireBase fireBase = FireBase();

  @override
  void initState() {
    fireBase.checkPresenceAndCreate();
    //fireBase.myProfile();
    /*fireBase.myProfileStream().listen((event) {
      print(event.username);
    });
    fireBase.myProfile().then((value) {
      this.setState(() {
        modelUser = value;
      });
    });*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: StreamBuilder<ModelUser>(
                  stream: fireBase.myProfileStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data?.username == "siftan10203099") {
                        return MainAdminScreen();
                      }
                      return Stack(children: [
                        SizedBox(
                          height: 250,
                          child: HeaderWidget(
                              240, false, Icons.person_add_alt_1_rounded),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: h * 0.17,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: h * 0.01, left: w * 0.01),
                                  child: CircleAvatar(
                                    radius: h * .04,
                                    backgroundColor: HexColor('#8A02AE'),
                                    child: snapshot.data!.profileImage == null
                                        ? CircleAvatar(
                                            radius: h * .036,
                                            backgroundImage: NetworkImage(
                                                "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png"),
                                            backgroundColor: Colors.white,
                                          )
                                        : CircleAvatar(
                                            radius: h * .036,
                                            backgroundImage: NetworkImage(
                                                "${snapshot.data!.profileImage}"),
                                            backgroundColor: Colors.white,
                                          ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: h * 0.01, left: w * 0.02),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Full name : ${snapshot.data!.fullName!}",
                                          style: GoogleFonts.oleoScript(
                                              color: Colors.white)),
                                      Text(
                                          "User Name:${snapshot.data!.username!}",
                                          style: GoogleFonts.oleoScript(
                                              color: Colors.white)),
                                      Text("Email: ${snapshot.data!.email!}",
                                          style: GoogleFonts.oleoScript(
                                              color: Colors.white)),
                                      TextButton(
                                          onPressed: () {
                                            Clipboard.setData(ClipboardData(
                                                    text: snapshot
                                                        .data!.refarralId))
                                                .then((value) {
                                              final snackbar = SnackBar(
                                                  content: Text(
                                                      "Copied: ${snapshot.data!.refarralId}"));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackbar);
                                            });
                                          },
                                          child: Text(
                                              "Refarral id: ${snapshot.data!.refarralId}",
                                              style: GoogleFonts.oleoScript(
                                                  color: Colors.white)))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ).asGlass(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: h * 0.18, left: w * 0.03),
                          child: Container(
                            height: h * 0.04,
                            width: w * .6,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(300),
                                    bottomLeft: Radius.circular(300))),
                            child: Padding(
                              padding: EdgeInsets.only(left: w * 0.05),
                              child: Text("Balance ${snapshot.data!.balance}",
                                  style: GoogleFonts.oleoScript(
                                      color: Colors.black54)),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: h * 0.32,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: HomePageBox( 
                                        hight: h*0.09,
                                        width: w,
                                        iconName: "WORk",
                                        theicon: FontAwesomeIcons.briefcase,
                                        goingScreen: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) => DailyWork(
                                                        modelUser: snapshot.data!,
                                                      )));
                                        }),
                              ),
                                SizedBox(
                                    width: w * 0.1,
                                  ),

                                  //..........................recarge.............//
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HomePageBox(
                                        hight: h*0.09,
                                          width: w,
                                        iconName: "Recharge",
                                        theicon: FontAwesomeIcons.bolt,
                                        goingScreen: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RechargeScreen()));
                                                      }),),
                                                        SizedBox(
                                    width: w * 0.1,
                                  ),

                                  //..........................recarge.............//
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HomePageBox(
                                        hight: h*0.09,
                                          width: w,
                                         iconName: "History",
                                      theicon: FontAwesomeIcons.history,
                                      goingScreen: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HistoryScreen(
                                                      modelUser: snapshot.data!,
                                                    )));
                                                      }),),
                                                       SizedBox(
                                    width: w * 0.1,
                                  ),

                                  //..........................recarge.............//
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HomePageBox(
                                        hight: h*0.09,
                                          width: w,
                                          theicon: FontAwesomeIcons.wallet,
                                      iconName: "Withraw",
                                     goingScreen: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WithdrawCashScreen(
                                                      modelUser: snapshot.data!,
                                                    )));
                                                      }),),
                                                        SizedBox(
                                    width: w * 0.1,
                                  ),

                                  //..........................recarge.............//
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HomePageBox(
                                        hight: h*0.09,
                                          width: w,
                                         iconName: "Message",
                                      theicon:
                                          FontAwesomeIcons.facebookMessenger,
                                      goingScreen: () {
                                        openwhatsapp(context);
                                      })),
                                             
                                      SizedBox(
                                    width: w * 0.1,
                                  ),

                                  //..........................recarge.............//
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HomePageBox(
                                        hight: h*0.09,
                                          width: w,
                                          theicon: FontAwesomeIcons.exclamationCircle,
                                      iconName: "Notice",
                                     goingScreen: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WithdrawCashScreen(
                                                      modelUser: snapshot.data!,
                                                    )));
                                                      }),),
                                        
                                   
                            Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut().then((value) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginOrSignup()));
            });
          }, child: Text("Log out")),
          ElevatedButton(onPressed: (){}, child: Text("Edit profile")),
        ],
      ),
    ),
                            ],
                          ),
                        ),
                      ]);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }))),
    );
  }
}
