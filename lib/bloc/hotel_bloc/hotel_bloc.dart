import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_managment/resource/providers/hotel_providers.dart';
import 'package:meta/meta.dart';

import '../../model/entity/HotelModel.dart';

part 'hotel_event.dart';

part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  List<HotelModel> hotelList=[];
  HotelBloc() : super(HotelInitial()) {

    on<HotelEvent>((event, emit) async {
      if (event is GetHotelsEvent) {
        try {
          emit(GetHotelsAwaitState());
          final getList=await GetIt.I.get<HotelRepository>().fetchHotels();
          hotelList=getList;
          emit(GetHotelsAcceptState());
        } catch (e) {
          emit(GetHotelsErrorState(e.toString()));
        }
      }
      // TODO: implement event handler
    });
  }
}
