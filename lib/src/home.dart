import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:new_app/src/custom_icon_button.dart';
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
        'dateColor': isToday ? AppColors.almostWhite : AppColors.black,
        'dayColor': isToday ? AppColors.almostWhite : AppColors.grey,
      };
    });

    final String mon = DateFormat.MMM().format(DateTime.now());
    List randomImages = [
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
                height: 200,
                width: 420,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 180,
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20, 12, 20, 14),
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Do your plan before 09:00 AM ',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                6.verticalSpacer,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        for (
                                          int i = 0;
                                          i < randomImages.length;
                                          i++
                                        )
                                          Align(
                                            widthFactor: 0.70,
                                            child: CircleAvatar(
                                              backgroundColor: AppColors.purple,
                                              radius: 22,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundImage:
                                                    randomImages[i],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    CircleAvatar(
                                      backgroundColor: AppColors.purple,
                                      radius: 22,
                                      child: CircleAvatar(
                                        radius: 20,
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
                      right: 60,
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
                      top: 30,
                      right: 34,
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
                          dateColor: item['dateColor'],
                          dayColor: item['dayColor'],
                        );
                      }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Your Plan',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 290,
                width: 420,
                child: Row(
                  children: [
                    Container(
                      height: 270,
                      width: 200,
                      margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.homeYellow,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(77, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Medium',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                          12.verticalSpacer,
                          Text(
                            'Yoga Group',
                            style: GoogleFonts.montserrat(
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                          5.verticalSpacer,
                          Text(
                            '25 Nov.',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            '14:00 - 15:00',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            'A5 Room',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                          Spacer(), // Pushes the row to the bottom

                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage('assets/user.webp'),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trainer',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Tiffany Way',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 180,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: 180,
                                  width: 160,
                                  margin: EdgeInsets.fromLTRB(0, 10, 20, 0),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.homeBlue,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                            77,
                                            255,
                                            255,
                                            255,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Text(
                                          'Medium',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors
                                                    .black, // or AppColors.black
                                          ),
                                        ),
                                      ),
                                      12.verticalSpacer,
                                      Text(
                                        'Balance',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Colors
                                                  .black, // or AppColors.black
                                        ),
                                      ),
                                      5.verticalSpacer,
                                      Text(
                                        '25 Nov.',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        '14:00-15:00',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        'A2 Room',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 10,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                  ),

                                  child: SvgPicture.asset(
                                    'assets/cube2.svg',
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          height: 80,
                          width: 160,
                          margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                          decoration: BoxDecoration(
                            color: AppColors.homePink,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomIconButton(
                                icon: FontAwesomeIcons.instagram,
                              ),
                              CustomIconButton(icon: FontAwesomeIcons.youtube),
                              CustomIconButton(icon: FontAwesomeIcons.twitter),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
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
              Icon(Icons.grid_view, color: AppColors.white, size: 30),
              Icon(Icons.analytics, color: AppColors.white, size: 30),

              Icon(Icons.person, color: AppColors.white, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
