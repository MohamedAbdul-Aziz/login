import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/provider/provider.dart';

import 'package:login/utils/strings.dart';
import 'package:login/view/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Provider.of<MyProvider>(context, listen: false).onexit();
        Navigator.pushReplacementNamed(
          context,
          login,
        );

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Provider.of<MyProvider>(context, listen: false).onexit();
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
                    NewContainer(
                      we: we,
                      text: "welcome",
                    ),
                    SizedBox(
                      width: we * .01,
                    ),
                    NewContainer(
                      we: we,
                      text: (Provider.of<MyProvider>(context).email),
                    ),
                  ],
                ),
                NewContainer(
                  we: we * 3,
                  text: (Provider.of<MyProvider>(context).valul).toString(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Provider.of<MyProvider>(context, listen: false)
                            .increase();
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
                        Provider.of<MyProvider>(context, listen: false)
                            .decrease();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
