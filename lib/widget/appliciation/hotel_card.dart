import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_managment/model/entity/HotelModel.dart';
import 'package:hotel_managment/style/app_font_size.dart';
import 'package:hotel_managment/style/app_text_style.dart';
import 'package:hotel_managment/utils/sizer.dart';

import '../../style/app_colors.dart';
import '../../utils/helpers.dart';

class HotelCard extends StatefulWidget {
  final HotelModel item;

  const HotelCard({Key? key, required this.item}) : super(key: key);

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    child: SizedBox(
                      child: CachedNetworkImage(
                        height: 15.h,
                        imageUrl: widget.item.image ?? '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => getShimmer(),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.3.h,
                  ),
                  Padding(
                    padding: Sizer.cardContentPadding,
                    child: Row(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                              5,
                              (index) => buildStar(context, index,
                                  double.parse(widget.item.stars.toString()),
                                  size: 14),
                            )),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "Hotel",
                          style: AppTextStyle.mediumBlack,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: Sizer.cardContentPadding,
                    child: Text(
                      widget.item.name,
                      style: AppTextStyle.largeBlackBold,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: Sizer.cardContentPadding,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.darkGreen2,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                              child: Padding(
                            padding: Sizer.reviewScorePadding,
                            child: Text(
                              widget.item.reviewScore.toString(),
                              style: AppTextStyle.mediumWhiteBold,
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          widget.item.review,
                          style: AppTextStyle.mediumBlack,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Icon(Icons.location_on_sharp, size: 15.sp),
                        Expanded(
                            child: Text(
                          widget.item.address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 100.w,
                        margin: Sizer.bottomContainerContentPadding,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.gray)),
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 1.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.skyColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(0.5.h),
                                    child: Text(
                                      "Our lowest Price",
                                      style: AppTextStyle.mediumBlackOffer,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "\$",
                                        style: AppTextStyle.mediumGreen,
                                      ),
                                      TextSpan(
                                        text: widget.item.price.toString(),
                                        style: AppTextStyle.largeGreen,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.45.h,
                                ),
                                Text("Renaissance"),
                                SizedBox(
                                  height: 1.5.h,
                                ),

                              ]),
                        ),
                      ),

                      Positioned(
                          right: 2.w,
                          top: 2.h,
                          child: TextButton(
                            child: Row(
                              children: [
                                Text(
                                  "View Deal",
                                  style: AppTextStyle.largeBlackBold,
                                ),
                                SizedBox(
                                  width: 0.5.w,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.black,
                                  size: 15,
                                )
                              ],
                            ),
                            onPressed: () {},
                          ))
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Padding(
                    padding: Sizer.bottomWidgetContentPadding,
                    child: Row(
                      children: [
                        Spacer(),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "More ",
                                style:TextStyle(
                                  color: AppColors.gray,
                                  fontFamily: "RobotBold",
                                  fontSize: AppFontSize.medium,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2.3
                                ),
                              ),
                              TextSpan(

                                text: "p",
                                style: TextStyle(
                                  color: AppColors.gray,
                                  fontFamily: "RobotBold",
 fontSize: AppFontSize.medium

                                ),
                              ),
                              TextSpan(

                                text: "rices",
                                style: TextStyle(
                                  color: AppColors.gray,
                                  fontSize: AppFontSize.medium,
                                  fontFamily: "RobotBold",
                                  decoration: TextDecoration.underline,
                                    decorationThickness: 2.3
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 2.h,
                right: 3.w,
                child: Center(
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        // Adjust sigmaX and sigmaY for blur intensity
                        child: Container(
                          color: Colors.transparent,
                          child: Center(
                              child: SvgPicture.asset(
                            'assets/svg/favorite.svg',
                            color: Colors.white,
                            height: 20,
                            width: 20,
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
