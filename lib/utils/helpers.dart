import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_managment/style/app_text_style.dart';
import 'package:hotel_managment/utils/sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../style/app_colors.dart';
import '../style/hotel_management_icons.dart';

Widget getShimmer({double? height, double? width}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    enabled: true,
    period: const Duration(milliseconds: 1500),
    child: Container(
      color: AppColors.blue,
      height: height,
      width: width,
    ),
  );
}

Widget buildRatingContainer(Color containerColor, String rating) {
  return Container(
    height: 4.5.h,
    width: 4.5.h,
    decoration: BoxDecoration(
        color: containerColor, borderRadius: BorderRadius.circular(4)),
    child: Center(
        child: Text(
      "$rating+",
      style: AppTextStyle.smallWhite,
    )),
  );
}

Widget buildHotelClassContainer(String imagePath) {
  return Container(
    height: 4.5.h,
    width: 4.5.h,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
    child: Center(
        child: SvgPicture.asset(
          height: 5.h,
          width: 5.h,
          imagePath,
      fit: BoxFit.contain,
    )),
  );
}

Widget buildStar(BuildContext context, int index, double rating,
    {double? size}) {
  Icon icon;
  if (index >= rating) {
    icon = Icon(
      HotelManagement.star,
      color: AppColors.gray,
      size: size != null ? size : null,
    );
  } else if (index > rating - 1 && index < rating) {
    icon = Icon(HotelManagement.star_half_alt,
        color: AppColors.orangeAccent, size: size != null ? size : null);
  } else {
    icon = Icon(
      HotelManagement.star,
      color: AppColors.orangeAccent,
      size: size != null ? size : null,
    );
  }
  return InkResponse(
    onTap: null,
    child: Padding(
        padding: EdgeInsetsDirectional.only(start: 1, end: 0.5), child: icon),
  );
}
