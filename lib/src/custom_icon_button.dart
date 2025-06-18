import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app/utils/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  const CustomIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: const Color(0xffd886da),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 14,
        child: FaIcon(icon, size: 16, color: Color(0xffd886da)),
      ),
    );
  }
}
