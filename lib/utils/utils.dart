import 'package:flutter/material.dart';
import 'package:new_app/utils/app_colors.dart';

extension NumX on num {
  Widget get verticalSpacer => SizedBox(height: toDouble());
  Widget get horizontalSpacer => SizedBox(width: toDouble());
  Widget get dividerGrey =>
      Divider(thickness: toDouble(), color: AppColors.grey300, height: 20);
}
