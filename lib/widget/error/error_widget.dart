import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_managment/utils/sizer.dart';

import '../../style/app_colors.dart';

class ReloadIndicator extends StatelessWidget {
  final dynamic error;
  final VoidCallback? onTap;

  const ReloadIndicator({
    Key? key,
    required this.error,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 3.h,
        horizontal: 10.w,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Builder(builder: (context) {
          if (error is SocketException) return getSocketWidget(context);
          if (error is TimeoutException) return getTimeoutWidget(context);
          return getSimpleWidget(context, error);
        }),
      ),
    );
  }

  Widget getSimpleWidget(BuildContext context, error) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          error.toString(),
          maxLines: 5,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.blue,
          ),
          child: SvgPicture.asset(
            "assets/svg/refresh.svg",
            height: 3.h,
          ),
        ),
      ],
    );
  }

  Widget getTimeoutWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "connection_timeout"  ,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
       " connection_timeout_des ",
          style: Theme.of(context).primaryTextTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.blue,
          ),
          child: SvgPicture.asset(
            "assets/svg/refresh.svg",
            height: 3.h,
          ),
        ),
      ],
    );
  }

  Widget getSocketWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture .asset("assets/svg/error_image.json", width: 120, height: 120),
        const SizedBox(height: 10),
        Text(
         "no_internet" ,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
         "no_internet_desc" ,
          style: Theme.of(context).primaryTextTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.blue,
          ),
          child: SvgPicture.asset(
            "assets/svg/refresh.svg",
            height: 3.h,
          ),
        ),
      ],
    );
  }
}
