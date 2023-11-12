import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_managment/utils/sizer.dart';
import 'package:hotel_managment/widget/button_app_bar.dart';
import 'package:internet_popup/internet_popup.dart';

import '../bloc/hotel_bloc/hotel_bloc.dart';
import '../style/app_colors.dart';
import '../widget/Button/commit_button.dart';
import '../widget/appliciation/hotel_card.dart';
import '../widget/bottom_sheet/filters_bottom_sheet.dart';
import '../widget/bottom_sheet/sorts_bottom_sheet.dart';
import '../widget/error/error_widget.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late HotelBloc _bloc;

  @override
  void initState() {
    InternetPopup().initialize(context: context);
    _bloc = BlocProvider.of<HotelBloc>(context);
    _bloc.add(GetHotelsEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: BlocBuilder<HotelBloc, HotelState>(
          builder: (context, state) {
            if (state is GetHotelsAwaitState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetHotelsErrorState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ReloadIndicator(error: state.message,onTap: (){_bloc.add(GetHotelsEvent());},)
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    height: 10.h,
                    child: Row(children: [
                      Expanded(
                          child: ButtonAppBar(
                            imagePath: 'assets/svg/filter.svg',
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  // <-- SEE HERE
                                    borderRadius:
                                    BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0))

                                ),
                                context: context,
                                backgroundColor: AppColors.background,
                                builder: (context) => ShowBottomSheetFilter(),
                              );
                            },
                            title: "Filters",
                          )),
                      Expanded(
                          child: ButtonAppBar(
                            imagePath: 'assets/svg/sort-desc-24.svg',
                            onTap: () {
                              //SortBottomSheet
                              showModalBottomSheet(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  // <-- SEE HERE
                                    borderRadius:
                                    BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0))

                                ),
                                context: context,
                                backgroundColor: AppColors.background,
                                builder: (context) => SortBottomSheet(),
                              );
                            },
                            title: "Sort",
                          ))
                    ]),
                  ),
                  Expanded(
                    child: Container(
                      margin: Sizer.cardPadding,
                      color: AppColors.background,
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return HotelCard(
                              item: _bloc.hotelList[index],
                            );
                          },
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 1.h,
                            mainAxisExtent:
                            MediaQuery
                                .of(context)
                                .size
                                .height / 2.1,
                          ),
                          itemCount: _bloc.hotelList.length),
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
