import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_managment/utils/sizer.dart';

import '../../style/app_colors.dart';
import '../../style/app_font_size.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({Key? key}) : super(key: key);

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      child: Container(
        color: AppColors.grayTransparent.withOpacity(0.2),
        height: MediaQuery.of(context).size.height / 1.1,
        child: CheckBoxListTile(),
      ),
    );
  }
}

class CheckBoxListTile extends StatefulWidget {
  const CheckBoxListTile({Key? key}) : super(key: key);

  @override
  State<CheckBoxListTile> createState() => _CheckBoxListTileState();
}

class _CheckBoxListTileState extends State<CheckBoxListTile> {
  List<String> itemList = [
    'Our Recommendations',
    'Rating & Recommended',
    'Price & Recommended',
    'Distance & Recommended',
    'Rating only',
    'Price only',
    'Distance only'
  ];
  Set<String> selectedItems = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Sort By",
          style: TextStyle(
              color: AppColors.black,
              fontFamily: "RobotBold",
              fontSize: AppFontSize.medium,
              decorationThickness: 2.3),
        ),
        centerTitle: true,
        leading: SizedBox(),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset('assets/svg/cancel.svg'),
              onPressed: () => {Navigator.pop(context)})
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Divider(color: AppColors.gray),
          ),
          Flexible(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: const Divider(color: AppColors.gray),
                );
              },
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                String item = itemList[index];
                return Column(
                  children: [
                    Container(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedItems.contains(item)) {
                                selectedItems.remove(item);
                              } else {
                                selectedItems.add(item);
                              }
                            });
                          },
                          child: Card(
                            margin: EdgeInsets.zero,
                            color: Colors.transparent,
                            elevation: 0,
                            child: ListTile(
                                dense: true,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 3.w),
                                trailing: Checkbox(
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                    return Colors.transparent;
                                  }),
                                  activeColor: AppColors.blue,
                                  checkColor: AppColors.blue,
                                  value: selectedItems.contains(item),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value != null && value) {
                                        selectedItems.add(item);
                                      } else {
                                        selectedItems.remove(item);
                                      }
                                    });
                                  },
                                ),
                                leading: Text(item)),
                          ),
                        ),
                      ),
                    ),
                    index == itemList.length - 1
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Divider(color: AppColors.gray),
                          )
                        : SizedBox()
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopWidget() {
    return Container(
      color: AppColors.white,
      height: 8.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: MediaQuery.of(context).size.width / 2.2),
                child: SvgPicture.asset('assets/svg/cancel.svg'),
              )
            ]),
      ),
    );
  }
}
