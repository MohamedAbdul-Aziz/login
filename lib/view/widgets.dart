import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewContainer extends StatelessWidget {
  const NewContainer({Key? key, required this.we, required this.text})
      : super(key: key);

  final double we;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: GoogleFonts.heebo(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: we * .1,
            letterSpacing: 2),
      ),
    );
  }
}