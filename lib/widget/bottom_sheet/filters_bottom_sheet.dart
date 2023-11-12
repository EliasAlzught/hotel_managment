import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_managment/style/app_colors.dart';
import 'package:hotel_managment/utils/sizer.dart';
import 'package:hotel_managment/widget/build_star.dart';
import 'package:hotel_managment/widget/stars/two_stars.dart';

import '../../style/app_font_size.dart';
import '../../utils/helpers.dart';
import '../Button/commit_button.dart';

class ShowBottomSheetFilter extends StatefulWidget {
  const ShowBottomSheetFilter({Key? key}) : super(key: key);

  @override
  State<ShowBottomSheetFilter> createState() => _ShowBottomSheetFilterState();
}

class _ShowBottomSheetFilterState extends State<ShowBottomSheetFilter> {
  int price = 20;
  double _currentSliderValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      child: Container(
        color: AppColors.grayTransparent.withOpacity(0.2),
        height: MediaQuery.of(context).size.height / 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopWidget(),
            _buildPriceWidget(),
            _buildRatingWidget(),
            _buildHotelClassWidget(),
            _buildDistanceWidget(),
            Expanded(
              child: Container(),
            ),
            BottomWidget()
          ],
        ),
      ),
    );
  }

  Widget _buildDistanceWidget() {
    return Padding(
      padding: Sizer.distancePadding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 6.h,
        ),
        Text(
          "DISTANCE FROM",
          style: TextStyle(
              color: AppColors.black,
              fontFamily: "RobotBold",
              fontSize: AppFontSize.medium,
              decorationThickness: 2.3),
        ),
        SizedBox(
          height: 1.h,
        ),
        const Divider(
          color: AppColors.gray,
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Location",
              style: TextStyle(
                  color: AppColors.black,
                  fontFamily: "Robot",
                  fontSize: AppFontSize.large,
                  decorationThickness: 2.3),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text(
                  "City center",
                  style: TextStyle(
                    color: AppColors.gray,
                    fontFamily: "Robot",
                    fontSize: AppFontSize.medium,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.gray,
                  size: 16,
                )
              ]),
            )
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        const Divider(
          color: AppColors.gray,
        ),
      ]),
    );
  }

  Widget _buildHotelClassWidget() {
    return Padding(
      padding: Sizer.FilterBottomSheetContentPadding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 4.h,
        ),
        Text(
          "HOTEL CLASS",
          style: TextStyle(
              color: AppColors.black,
              fontFamily: "RobotBold",
              fontSize: AppFontSize.medium,
              decorationThickness: 2.3),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildHotelClassContainer('assets/svg/star00.svg'),
            buildHotelClassContainer('assets/svg/star01.svg'),
            buildHotelClassContainer('assets/svg/star02.svg'),
            buildHotelClassContainer('assets/svg/star03.svg'),
            buildHotelClassContainer('assets/svg/star04.svg'),
          ],
        )
      ]),
    );
  }

  Widget _buildRatingWidget() {
    return Padding(
      padding: Sizer.FilterBottomSheetContentPadding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 4.h,
        ),
        Text(
          "RATING",
          style: TextStyle(
              color: AppColors.black,
              fontFamily: "RobotBold",
              fontSize: AppFontSize.medium,
              decorationThickness: 2.3),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildRatingContainer(AppColors.red, "0"),
            buildRatingContainer(AppColors.orange, "7"),
            buildRatingContainer(AppColors.green100, "7.5"),
            buildRatingContainer(AppColors.green200, "8"),
            buildRatingContainer(AppColors.darkGreen, "8.5")
          ],
        )
      ]),
    );
  }

  Widget _buildPriceWidget() {
    return Padding(
      padding: Sizer.FilterBottomSheetContentPadding,
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "PRICE PER NIGHT",
                style: TextStyle(
                    color: AppColors.black,
                    fontFamily: "RobotBold",
                    fontSize: AppFontSize.medium,
                    decorationThickness: 2.3),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.gray)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${getIntNumber(_currentSliderValue)} +",
                          style: TextStyle(
                              color: AppColors.black,
                              fontFamily: "Robot",
                              fontSize: AppFontSize.medium,
                              decorationThickness: 2.3),
                        ),
                        TextSpan(
                          text: "  \$",
                          style: TextStyle(
                              color: AppColors.gray,
                              fontFamily: "Robot",
                              fontSize: AppFontSize.medium,
                              decorationThickness: 2.3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Slider(
            activeColor: AppColors.blue,
            value: _currentSliderValue,
            max: 540,
            min: 20,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ 20+",
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: "Robot",
                    fontSize: AppFontSize.small,
                  )),
              Text("\$ 540+",
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: "Robot",
                    fontSize: AppFontSize.small,
                  )),
            ],
          )
        ],
      ),
    );
  }

  int getIntNumber(double Number) {
    return Number.toInt();
  }

  Widget _buildTopWidget() {
    return Container(
      color: AppColors.white,
      height: 8.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Reset",
            style: TextStyle(
                color: AppColors.grayTransparent,
                fontFamily: "RobotBold",
                fontSize: AppFontSize.medium,
                decoration: TextDecoration.underline,
                decorationThickness: 2.3),
          ),
          Text(
            "Filters",
            style: TextStyle(
                color: AppColors.black,
                fontFamily: "RobotBold",
                fontSize: AppFontSize.medium,
                decorationThickness: 2.3),
          ),
          InkWell(
            child: SvgPicture.asset('assets/svg/cancel.svg'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ]),
      ),
    );
  }
}

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.white, // Set the background color if needed
        padding: EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
          child: CommitButton(
            onPressed: () {},
            text: "Show result",
          ),
        ));
  }
}
