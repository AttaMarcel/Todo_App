import 'package:flutter/material.dart';
class DetailView extends StatelessWidget {
  const DetailView({ Key? key,required this.title,required this.subtittle }) : super(key: key);
final String title;
final String subtittle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: (Colors.white60),
          title: Text(
        'Your Todo',
        style:TextStyle(color:Colors.black)
        ),
      ),
      body: ListView(
        children: [
          Text(title,
          style:TextStyle(
            fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: 20,
        ),
           Text(subtittle)
        ],
      ),
      ),
    );
  }
}