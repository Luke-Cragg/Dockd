import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'Home.dart';
import 'Settings.dart';

class VehiclePage extends StatefulWidget {
  @override
  Vehicles createState() => Vehicles();
}

class Vehicles extends State<VehiclePage> {
  int selectedPage = 1;
  final Color BackGrey = const Color(0xFF232323);
  final Color BackBlack = Color.fromARGB(255, 0, 0, 0).withOpacity(1);

  @override
  Widget build(BuildContext context) {
    Paint.enableDithering = true;
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Dockd',
              style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 35.0)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [BackGrey, BackBlack],
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
            children: [
              Text(
                'Trucks',
                style:
                    GoogleFonts.merriweather(fontSize: 35, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
