import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/utils/app_colors.dart';

class DateContainer extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String day;
  final int date;
  bool isDot;
  DateContainer({
    super.key,
    required this.color,
    required this.textColor,
    required this.day,
    required this.date,
    required this.isDot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 50,

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: AppColors.grey, width: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isDot ? Text('●', style: TextStyle(color: textColor)) : Text(''),
          Text(
            day,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(color: textColor, fontSize: 18),
            ),
          ),
          Text(
            date.toString(),
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
