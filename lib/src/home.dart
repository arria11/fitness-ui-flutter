import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:new_app/src/date_container.dart';
import 'package:new_app/utils/app_colors.dart';
import 'package:new_app/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final String day = DateFormat.d().format(DateTime.now());
    final today = DateTime.now();

    final List<Map<String, dynamic>> dateInfoList = List.generate(7, (index) {
      final int offset = index - 3;
      final DateTime date = DateTime.now().add(Duration(days: offset));
      final isToday =
          today.day == date.day &&
          today.month == date.month &&
          today.year == date.year;
      return {
        'day': DateFormat.E().format(date),
        'date': date.day,
        'isDot': index % 2 != 0,
        'color': isToday ? AppColors.bottomBarColor : AppColors.almostWhite,
        'textColor': isToday ? AppColors.almostWhite : AppColors.grey,
      };
    });

    final String mon = DateFormat.MMM().format(DateTime.now());
    List RandomImages = [
      AssetImage('assets/man.jpg'),
      AssetImage('assets/woman1.jpg'),
      AssetImage('assets/user.webp'),
    ];
    return Scaffold(
      backgroundColor: AppColors.almostWhite,
      appBar: AppBar(
        backgroundColor: AppColors.almostWhite,
        toolbarHeight: 90,
        title: Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/user.webp'),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Text(
                      'Hello, Sandra',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: AppColors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      'Today $day $mon.',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.almostWhite,
                    child: Icon(Icons.search, color: AppColors.black, size: 35),
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 260,
                width: 420,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 220,
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20, 12, 20, 14),
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 15),
                        decoration: BoxDecoration(
                          color: AppColors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Daily\nchallenge',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Do your plan before 09:00 AM ',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                12.verticalSpacer,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        for (
                                          int i = 0;
                                          i < RandomImages.length;
                                          i++
                                        )
                                          Align(
                                            widthFactor: 0.70,
                                            child: CircleAvatar(
                                              backgroundColor: AppColors.purple,
                                              radius: 27,
                                              child: CircleAvatar(
                                                radius: 24,
                                                backgroundImage:
                                                    RandomImages[i],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    CircleAvatar(
                                      backgroundColor: AppColors.purple,
                                      radius: 26,
                                      child: CircleAvatar(
                                        radius: 24,
                                        backgroundColor: AppColors.deepPurple,
                                        child: Text(
                                          '+4',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: AppColors.almostWhite,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -30,
                      right: 50,
                      child: Container(
                        height: 200,
                        width: 120,
                        decoration: BoxDecoration(shape: BoxShape.rectangle),
                        child: SvgPicture.asset(
                          'assets/cube2.svg',
                          fit: BoxFit.contain, // or BoxFit.cover
                        ),
                      ),
                    ),
                    Positioned(
                      top: 52,
                      right: 30,
                      child: Container(
                        height: 200,
                        width: 120,
                        decoration: BoxDecoration(shape: BoxShape.rectangle),
                        child: SvgPicture.asset(
                          'assets/cube2.svg',
                          fit: BoxFit.contain, // or BoxFit.cover
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 120,
                width: 420,
                margin: EdgeInsets.fromLTRB(18, 0, 18, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:
                      dateInfoList.map((item) {
                        return DateContainer(
                          day: item['day'],
                          date: item['date'],
                          isDot: item['isDot'],
                          color: item['color'],
                          textColor: item['textColor'],
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 80,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.fromLTRB(24, 0, 24, 8),
          decoration: BoxDecoration(
            color: AppColors.bottomBarColor,
            borderRadius: BorderRadius.all(Radius.circular(42)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home, color: AppColors.white, size: 30),
              Icon(Icons.app_registration, color: AppColors.white, size: 30),
              Icon(
                Icons.stacked_bar_chart_outlined,
                color: AppColors.white,
                size: 30,
              ),
              Icon(Icons.person_4_outlined, color: AppColors.white, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
