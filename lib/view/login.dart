import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/home.dart';
import 'package:login/provider/provider.dart';
import 'package:login/utils/strings.dart';
import 'package:provider/provider.dart';

import '../anmition/fadeanimation.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatelessWidget {
  late String Email;
  late int number;

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xFF1F1A30),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<MyProvider>(
            context,
          ).looding,
          child: SingleChildScrollView(
            child: SafeArea(
              child: SizedBox(
                width: we,
                height: he,
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                      delay: 0.8,
                      child: CachedNetworkImage(
                        imageUrl: Urlimage,
                        width: we * 0.9,
                        height: he * 0.4,
                      ),
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 230.0),
                        child: Text(
                          "Login",
                          style: GoogleFonts.heebo(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: he * 0.01,
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 150.0),
                        child: Text(
                          "Please sing in to continue",
                          style: GoogleFonts.heebo(
                              color: Colors.grey, letterSpacing: 0.5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: he * 0.04,
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: Container(
                        width: we * 0.9,
                        height: he * 0.071,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: enabledtxt,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) => Email = value,
                          onTap: () {},
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: backgroundColor,
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: deaible,
                            ),
                          ),
                          style: TextStyle(
                              color: backgroundColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: he * 0.1,
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: TextButton(
                        onPressed: () async {
                          if (Email != "") {
                            Provider.of<MyProvider>(context, listen: false)
                                .getinstance(Email, context);
                          }
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.heebo(
                            color: Colors.black,
                            letterSpacing: 0.5,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF0DF5E4),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 80),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: he * 0.08),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
