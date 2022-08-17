import 'package:flutter/material.dart';
import 'package:icbapps/models/ModelUser.dart';
import 'package:icbapps/screens/widgets/header_widget.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key, required this.modelUser}) : super(key: key);
  ModelUser modelUser;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      body: Stack(children: [
        SizedBox(
          height: 250,
          child: HeaderWidget(240, false, Icons.abc_outlined))
      ],) );
  }
}