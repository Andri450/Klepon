import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetTheme {
  Color? themeColors(parameter) {
    switch (parameter) {
      case 'basesColor':
        return baseColor;
      case 'primaryColor':
        return primaryColor;
      case 'secondaryColor':
        return secondaryColor;
      case 'successColor':
        return successColor;
      case 'dangerColor':
        return dangerColor;
      case 'darkColor':
        return darkColor;
    }
    return null;
  }

  // color
  Color baseColor = const Color.fromARGB(255, 255, 255, 255);
  Color primaryColor = const Color.fromARGB(255, 69, 175, 86);
  Color secondaryColor = const Color.fromARGB(255, 219, 219, 219);
  Color successColor = const Color.fromARGB(255, 0, 177, 68);
  Color dangerColor = const Color.fromARGB(255, 255, 1, 18);
  Color darkColor = const Color.fromARGB(255, 0, 6, 25);

  //text style
  TextStyle titleHeading = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 30,
  );

  TextStyle subTitleHeading = GoogleFonts.roboto(
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  TextStyle titleHeadingOnBoarding = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  TextStyle subTitleHeadingOnboard = GoogleFonts.roboto(
    color: const Color.fromARGB(255, 79, 77, 77),
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  TextStyle titleHeadingBerita = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  TextStyle judulWelcome = GoogleFonts.poppins(
    color: const Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w600,
    fontSize: 30,
  );

  TextStyle judulprimary = GoogleFonts.poppins(
    color: const Color.fromARGB(255, 69, 175, 86),
    fontWeight: FontWeight.w600,
    fontSize: 30,
  );
}
