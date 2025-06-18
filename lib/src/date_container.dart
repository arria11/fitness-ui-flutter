import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/utils/app_colors.dart';

class DateContainer extends StatelessWidget {
  final Color color;
  final Color dayColor;
  final Color dateColor;
  final String day;
  final int date;
  final bool isDot;
  const DateContainer({
    super.key,
    required this.color,
    required this.dayColor,
    required this.dateColor,
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
          isDot ? Text('●', style: TextStyle(color: dateColor)) : Text(''),
          Text(
            day,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(color: dayColor, fontSize: 18),
            ),
          ),
          Text(
            date.toString(),
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: dateColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
