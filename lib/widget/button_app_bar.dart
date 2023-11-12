import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_managment/style/app_font_size.dart';
import 'package:hotel_managment/utils/sizer.dart';

import '../style/app_colors.dart';

class ButtonAppBar extends StatefulWidget {
  final String title;
  final String imagePath;
  final Function() onTap;

  const ButtonAppBar(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.imagePath})
      : super(key: key);

  @override
  State<ButtonAppBar> createState() => _ButtonAppBarState();
}

class _ButtonAppBarState extends State<ButtonAppBar> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,

      style: ElevatedButton.styleFrom(
          primary:  Colors.transparent ,
        foregroundColor: Colors.transparent ,
        backgroundColor: AppColors.white,
        onPrimary: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
      ),
      child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.imagePath,
            width: 30,
            height: 30,
            color: AppColors.blue,
          ),
            SizedBox(width: 2.w),
            Text(
              widget.title,
              style: TextStyle(
                  color: AppColors.blue,
                  fontFamily: "Robot",
                  fontWeight: FontWeight.w300,
                  fontSize: AppFontSize.large),
            ),
        ],
      ),
    );
    //   Container(
    //   child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Expanded(
    //           child:
    //           Center(
    //             child:
    //             SvgPicture.asset(
    //               'assets/svg/filter.svg',
    //               width: 20,
    //               height: 20,
    //               color: AppColors.blue,
    //             ),
    //           ),
    //         ),
    //         SizedBox(width: 2.w,),
    //         Expanded(
    //           child: Center(
    //             child: Text(
    //               widget.title,
    //               style: TextStyle(
    //                   color: AppColors.blue,
    //                   fontFamily: "RobotThin",
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: AppFontSize.medium),
    //             ),
    //           ),
    //         )
    //       ]),
    // );
  }
}
