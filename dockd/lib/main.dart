import 'package:dockd/Navigation.dart';
import 'package:dockd/VehicleTracking.dart';
import 'package:dockd/Vehicles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dockd/Home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Dockd';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(_title,
              style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 35.0)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: const MainStatefulWidget(),
      ),
    );
  }
}

class MainStatefulWidget extends StatefulWidget {
  const MainStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MainStatefulWidget> createState() => _MainStatefulWidget();
}

class _MainStatefulWidget extends State<MainStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Color BackGrey = const Color(0xFF232323);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [BackGrey, Colors.black]),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: Text(
                'Log in',
                style:
                    GoogleFonts.merriweather(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey,
                    labelText: 'UserName',
                  )),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey,
                    labelText: 'Password',
                  )),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password'),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    if (nameController.text == 'lukecragg' &&
                        passwordController.text == 'Password') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VehicleTracker()));
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Incorrect Username / Password'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ok'))
                            ],
                          );
                        },
                      );
                    }
                  }),
            )
          ],
        ));
  }
}
