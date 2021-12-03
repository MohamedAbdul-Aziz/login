import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login/utils/strings.dart';

class Home extends StatefulWidget {
  final email;
  final value;

  Home({Key? key, required this.email, required this.value}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int number;
  @override
  void initState() {
    number = widget.value;
    super.initState();
  }

  void dispose() {
    FirebaseDatabase.instance.reference().child(widget.email).set(number);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                login,
              );
            },
            icon: const Icon(
              Icons.exit_to_app,
            )),
      ),
      body: SafeArea(
        child: Container(
          color: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    child: Text(
                      "welcome",
                      style: GoogleFonts.heebo(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: we * .1,
                          letterSpacing: 2),
                    ),
                  ),
                  SizedBox(
                    width: we * .01,
                  ),
                  Container(
                    child: Text(
                      widget.email,
                      style: GoogleFonts.heebo(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: we * .1,
                          letterSpacing: 2),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  "${number}",
                  style: GoogleFonts.heebo(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: we * .3,
                      letterSpacing: 2),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        number += 1;
                      });
                    },
                    child: Text(
                      "increase",
                      style: GoogleFonts.heebo(
                        color: Colors.black,
                        letterSpacing: 0.9,
                        fontSize: he * .04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF0DF5E4),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: we * .1,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        number -= 1;
                      });
                    },
                    child: Text(
                      "decrease",
                      style: GoogleFonts.heebo(
                        color: Colors.black,
                        letterSpacing: 0.9,
                        fontSize: he * .04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF0DF5E4),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: we * .08,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    login,
                  );
                },
                child: Text(
                  "Exit",
                  style: GoogleFonts.heebo(
                    color: Colors.black,
                    letterSpacing: 0.9,
                    fontSize: he * .05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
