import 'package:dockd/Navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'Settings.dart';
import 'Vehicles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  MainHome createState() => MainHome();
}

class MainHome extends State<Home> {
  int selectedPage = 0;
  final Color BackGrey = const Color(0xFF232323);
  final Color BackBlack = Color.fromARGB(255, 0, 0, 0).withOpacity(1);
  final Color Carbon = Color.fromARGB(255, 58, 54, 54);
  String Username = '';

  Future<void> _getCurrentUserName() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .get()
        .then((snapshot) {
      setState(() {
        Username =
            (snapshot.data() as Map<String, dynamic>)['DisplayName'].toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUserName();
  }

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
                'Welcome ${Username}',
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
